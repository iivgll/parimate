import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/providers.dart';
import '../repositories/user_repository.dart';
import '../repositories/chat_repository.dart';
import '../repositories/challenge_repository.dart';
import '../repositories/participation_repository.dart';
import '../repositories/confirmation_repository.dart';
import '../repositories/notification_repository.dart';
import '../repositories/file_repository.dart';
import '../repositories/code_word_repository.dart';
import '../repositories/coins_repository.dart';
import '../repositories/metadata_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  throw UnimplementedError();
});

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  throw UnimplementedError();
});

final challengeRepositoryProvider = Provider<ChallengeRepository>((ref) {
  throw UnimplementedError();
});

final participationRepositoryProvider =
    Provider<ParticipationRepository>((ref) {
  throw UnimplementedError();
});

final confirmationRepositoryProvider = Provider<ConfirmationRepository>((ref) {
  return ConfirmationRepository(ref.watch(dioProvider));
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  throw UnimplementedError();
});

final fileRepositoryProvider = Provider<FileRepository>((ref) {
  return FileRepository(ref.watch(dioProvider));
});

final codeWordRepositoryProvider = Provider<CodeWordRepository>((ref) {
  return CodeWordRepository(ref.read(dioProvider));
});

final coinsRepositoryProvider = Provider<CoinsRepository>((ref) {
  throw UnimplementedError();
});

final metadataRepositoryProvider = Provider<MetadataRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return MetadataRepository(dio);
});
