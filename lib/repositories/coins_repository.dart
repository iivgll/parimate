import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';

class CoinsRepository {
  final Dio _dio;

  CoinsRepository(this._dio);

  Future<void> buyCoins({
    required String userTgId,
    required int coins,
  }) async {
    try {
      await _dio.post(
        '/api/v2/coins',
        data: {
          'user_tg_id': userTgId,
          'coins': coins,
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
