import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/notification.dart';
import '../services/telegram_service.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(this._dio);

  Future<void> createNotification({
    required int hours,
    required int minutes,
  }) async {
    try {
      await _dio.post(
        '/api/v2/notification',
        data: {
          'hours': hours,
          'minutes': minutes,
          'user_tg_id': TelegramService.instance.id,
        },
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<NotificationSchema>> getNotifications() async {
    try {
      final response = await _dio.get(
        '/api/v2/notification',
        queryParameters: {'user_tg_id': TelegramService.instance.id},
      );
      return (response.data as List)
          .map((json) => NotificationSchema.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteNotification({
    required int notificationId,
  }) async {
    try {
      await _dio.delete(
        '/api/v2/notification',
        queryParameters: {
          'user_tg_id': TelegramService.instance.id,
          'notification_id': notificationId,
        },
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> activateNotifications() async {
    try {
      await _dio.post(
        '/api/v2/notification/activate',
        queryParameters: {'user_tg_id': TelegramService.instance.id},
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> disableNotifications() async {
    try {
      await _dio.delete(
        '/api/v2/notification/disable',
        queryParameters: {'user_tg_id': TelegramService.instance.id},
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
