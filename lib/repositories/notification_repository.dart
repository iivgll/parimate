import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/notification.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(this._dio);

  Future<void> createNotification({
    required int hours,
    required int minutes,
    required String userTgId,
  }) async {
    try {
      await _dio.post(
        '/api/v2/notification',
        data: {
          'hours': hours,
          'minutes': minutes,
          'user_tg_id': userTgId,
        },
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<NotificationSchema>> getNotifications({
    required String userTgId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v2/notification',
        queryParameters: {'user_tg_id': userTgId},
      );
      return (response.data as List)
          .map((json) => NotificationSchema.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteNotification({
    required String userTgId,
    required int notificationId,
  }) async {
    try {
      await _dio.delete(
        '/api/v2/notification',
        queryParameters: {
          'user_tg_id': userTgId,
          'notification_id': notificationId,
        },
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> activateNotifications({
    required String userTgId,
  }) async {
    try {
      await _dio.post(
        '/api/v2/notification/activate',
        queryParameters: {'user_tg_id': userTgId},
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> disableNotifications({
    required String userTgId,
  }) async {
    try {
      await _dio.delete(
        '/api/v2/notification/disable',
        queryParameters: {'user_tg_id': userTgId},
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
