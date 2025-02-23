import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';

import '../services/telegram_service.dart';

class CoinsRepository {
  final Dio _dio;

  CoinsRepository(this._dio);

  Future<CoinsResponse> buyCoins({
    required int coins,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/coins',
        data: {
          'user_tg_id': TelegramService.instance.id,
          'coins': coins,
        },
      );
      return CoinsResponse.fromJson(response.data);
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

class CoinsResponse {
  final String confirmationLink;

  CoinsResponse({required this.confirmationLink});

  factory CoinsResponse.fromJson(Map<String, dynamic> json) {
    return CoinsResponse(
      confirmationLink: json['confirmation_link'] as String,
    );
  }
}
