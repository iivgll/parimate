import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/chat/chat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRepository {
  final Dio _dio;

  ChatRepository(this._dio);

  Future<List<Chat>> getUserChats({required String userTgId}) async {
    try {
      final response = await _dio.get(
        '/api/v2/chat/my',
        queryParameters: {'user_tg_id': userTgId},
      );
      return (response.data as List)
          .map((json) => Chat.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Chat> addChat({
    required String id,
    required String link,
    String? photo,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/chat',
        data: {
          'id': id,
          'link': link,
          if (photo != null) 'photo': photo,
        },
      );
      return Chat.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> addAdminChat({
    required String chatId,
    required int challengeId,
  }) async {
    try {
      await _dio.post(
        '/api/v2/chat/admin',
        data: {
          'chat_id': chatId,
          'challenge_id': challengeId,
        },
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException error) {
    if (error.response?.statusCode == 422) {
      return ValidationException(
          error.response?.data['detail'] ?? 'Ошибка валидации');
    }
    return Exception(error.message ?? 'Произошла ошибка');
  }
}
