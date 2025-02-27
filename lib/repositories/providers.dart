import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:parimate/main.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:parimate/repositories/metadata_repository.dart';
import 'user_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://test.parimate.ru',
  ));

  // Добавляем Talker интерцептор
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
      ),
    ),
  );

  return dio;
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.watch(dioProvider));
});

final metadataRepositoryProvider = Provider<MetadataRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return MetadataRepository(dio);
});
