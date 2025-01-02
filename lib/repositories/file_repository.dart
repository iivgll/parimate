import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import 'dart:io';
import '../models/file.dart';

class FileRepository {
  final Dio _dio;

  FileRepository(this._dio);

  Future<UploadFileResponseSchema> uploadFile({
    required File file,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });

      final response = await _dio.post(
        '/api/v2/file',
        data: formData,
      );
      return UploadFileResponseSchema.fromJson(response.data);
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
