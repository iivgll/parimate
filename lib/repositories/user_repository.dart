import 'package:dio/dio.dart';
import '../models/user/user.dart';
import '../models/user_statistics.dart';
import '../models/user_challenge_statistics.dart';
import '../services/telegram_service.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<User> getUser() async {
    try {
      final response = await _dio.get(
        '/api/v2/user',
        queryParameters: {'user_tg_id': TelegramService.instance.id},
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<User> createUser({
    required String username,
    required String tgId,
    required String name,
    String? photo,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/user',
        data: {
          'username': TelegramService.instance.username,
          'tg_id': TelegramService.instance.id,
          'name': TelegramService.instance.firstName,
          if (photo != null) 'photo': photo,
        },
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<UserStatistics> getUserStatistics() async {
    try {
      final response = await _dio.get(
        '/api/v2/user/statistics',
        queryParameters: {'user_tg_id': TelegramService.instance.id},
      );
      return UserStatistics.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<UserChallengeStatisticsSchema> getUserChallengeStatistics({
    required int challengeId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/user/challenge/statistics',
        queryParameters: {
          'user_tg_id': TelegramService.instance.id,
          'challenge_id': challengeId,
        },
      );
      return UserChallengeStatisticsSchema.fromJson(response.data);
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

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}
