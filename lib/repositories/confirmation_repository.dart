import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/confirmation.dart';

class ConfirmationRepository {
  final Dio _dio;

  ConfirmationRepository(this._dio);

  Future<bool> postConfirmation({
    required String userTgId,
    required int challengeId,
    required ConfirmationData data,
    required bool share,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/confirmation',
        data: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
          'data': data.toJson(),
          'share': share,
        },
      );

      return response.statusCode == 200;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<ConfirmationListResponse> getUserConfirmations({
    required String userTgId,
    required int challengeId,
    required int limit,
    int? lastReadId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/confirmation',
        queryParameters: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
          'limit': limit,
          if (lastReadId != null) 'last_read_id': lastReadId,
        },
      );
      return ConfirmationListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<ConfirmationListResponse> getUnvalidatedConfirmations({
    required int challengeId,
    required int limit,
    int? lastReadId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/confirmation/unvalidated',
        queryParameters: {
          'challenge_id': challengeId,
          'limit': limit,
          if (lastReadId != null) 'last_read_id': lastReadId,
        },
      );
      return ConfirmationListResponse.fromJson(response.data);
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
