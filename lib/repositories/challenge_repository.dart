import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/challenge/challenge.dart';
import '../models/challenge/challenge_creation.dart';
import '../models/challenge_statistics.dart';
import '../models/challenge_action_price.dart';
import '../models/challenge_model.dart';

class ChallengeRepository {
  final Dio _dio;

  ChallengeRepository(this._dio);

  Future<Challenge> getChallenge({
    required String userTgId,
    required int challengeId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge',
        queryParameters: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
        },
      );
      return Challenge.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Challenge> createChallenge(Map<String, dynamic> challengeData) async {
    try {
      final response = await _dio.post(
        '/api/v2/challenge',
        data: challengeData,
      );
      return Challenge.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 418 &&
          e.response?.data['message'] != null) {
        throw Exception(e.response?.data['message']);
      }
      throw _handleDioError(e);
    }
  }

  Future<Challenge> createChallengeFromSchema(
      ChallengeCreationSchema challenge) async {
    try {
      final response = await _dio.post(
        '/api/v2/challenge',
        data: challenge.toJson(),
      );
      return Challenge.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteChallenge({
    required int challengeId,
    required String userTgId,
  }) async {
    try {
      await _dio.delete(
        '/api/v2/challenge',
        queryParameters: {
          'challenge_id': challengeId,
          'user_tg_id': userTgId,
        },
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Challenge> getChallengeByLink({
    required String userTgId,
    required String link,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge/by-link',
        queryParameters: {
          'user_tg_id': userTgId,
          'link': link,
        },
      );
      return Challenge.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Challenge>> getUserChallenges({required String userTgId}) async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge/my',
        queryParameters: {'user_tg_id': userTgId},
      );
      return (response.data as List)
          .map((json) => Challenge.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<ChallengeModel>> getNewChallenges() async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge/new',
        queryParameters: {'user_tg_id': '44'}, // TODO: получать реальный tg_id
      );
      return (response.data as List)
          .map((json) => ChallengeModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load new challenges: $e');
    }
  }

  Future<ChallengeStatistics> getChallengeStatistics({
    required String userTgId,
    required int challengeId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge/statistics',
        queryParameters: {
          'user_tg_id': userTgId,
          'challenge_id': challengeId,
        },
      );
      return ChallengeStatistics.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<ChallengeActionPriceSchema> getCreationPrice({
    required String userTgId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge/creation-price',
        queryParameters: {'user_tg_id': userTgId},
      );
      return ChallengeActionPriceSchema.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Аналогичные методы для return-price и registration-price...

  Future<List<ChallengeModel>> getMyChallenges() async {
    try {
      final response = await _dio.get(
        '/api/v2/challenge/my',
        queryParameters: {'user_tg_id': '44'},
      );
      return (response.data as List)
          .map((json) => ChallengeModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load challenges: $e');
    }
  }

  Exception _handleDioError(DioException error) {
    if (error.response?.data != null &&
        error.response?.data['message'] != null) {
      // Если есть сообщение об ошибке в ответе, возвращаем его
      return Exception(error.response?.data['message']);
    }

    if (error.response?.statusCode == 422) {
      return ValidationException(
          error.response?.data['detail'] ?? 'Ошибка валидации');
    }

    return Exception(error.message ?? 'Произошла ошибка');
  }
}
