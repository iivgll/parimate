import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/participation.dart';

class ParticipationRepository {
  final Dio _dio;

  ParticipationRepository(this._dio);

  Future<ParticipationSchema> registerToChallenge({
    required String userTgId,
    required int challengeId,
    required bool accepted,
    required bool payed,
    required String confirmationType,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/participation',
        data: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
          'accepted': accepted,
          'payed': payed,
          'confirmation_type': confirmationType,
        },
      );

      return ParticipationSchema.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<ParticipationSchema> returnToChallenge({
    required String userTgId,
    required int challengeId,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/participation/return',
        data: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
        },
      );

      // Оборачиваем ответ в нужную структуру
      return ParticipationSchema.fromJson(
          {'participation': response.data, 'confirmation_url': null});
    } on DioException catch (e) {
      if (e.response?.statusCode == 418 &&
          e.response?.data['message']
                  ?.toString()
                  .contains('недостаточно монеток') ==
              true) {
        throw InsufficientCoinsException(e.response?.data['message']);
      }
      throw _handleDioError(e);
    }
  }

  Future<ParticipationSchema> joinToChallengeViaLink({
    required String link,
    required String userTgId,
    required bool accepted,
    required bool payed,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/participation/join',
        data: {
          'link': link,
          'user_tg_id': userTgId,
          'accepted': accepted,
          'payed': payed,
        },
      );
      return ParticipationSchema.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> leaveChallenge({
    required String userTgId,
    required int challengeId,
  }) async {
    try {
      await _dio.delete(
        '/api/v2/participation',
        queryParameters: {
          'user_tg_id': userTgId,
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
    if (error.response?.statusCode == 418) {
      // Пробрасываем DioException дальше для обработки в UI
      return error;
    }
    return Exception(error.message ?? 'Произошла ошибка');
  }
}

class InsufficientCoinsException implements Exception {
  final String? message;
  InsufficientCoinsException([this.message]);

  @override
  String toString() => message ?? 'Недостаточно монет';
}
