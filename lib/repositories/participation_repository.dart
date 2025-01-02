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
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/participation',
        data: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
          'accepted': accepted,
          'payed': payed,
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
      return ParticipationSchema.fromJson(response.data);
    } on DioException catch (e) {
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

  Exception _handleDioError(DioException error) {
    if (error.response?.statusCode == 422) {
      return ValidationException(
          error.response?.data['detail'] ?? 'Ошибка валидации');
    }
    return Exception(error.message ?? 'Произошла ошибка');
  }
}
