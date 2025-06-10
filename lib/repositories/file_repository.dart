import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

import '../services/telegram_service.dart';

class FileRepository {
  final Dio _dio;

  FileRepository(this._dio);

  Future<String> uploadFile(
    XFile file, {
    required int challengeId,
  }) async {
    try {
      final filename = path
          .basename(file.path)
          .replaceAll(RegExp(r'[^\w\s\-.]'), '')
          .replaceAll(RegExp(r'\s+'), '_');

      // Получаем MIME тип из XFile
      final mimeType =
          file.mimeType ?? 'image/png'; // Используем тип из XFile или дефолтный

      final bytes = await file.readAsBytes();

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          bytes,
          filename: filename,
          contentType: MediaType.parse(mimeType),
        ),
      });

      final response = await _dio.post(
        '/api/v2/file',
        data: formData,
        queryParameters: {
          'user_tg_id': TelegramService.instance.id,
          'challenge_id': challengeId,
        },
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return response.data['key'] as String;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Шаг 1: Получить presigned URL для загрузки в S3
  Future<Map<String, dynamic>> getS3UploadUrl(
    String filename,
    XFile file, {
    required int challengeId,
  }) async {
    try {
      final fileSize = await file.length();
      final mimeType = file.mimeType ?? 'video/mp4';

      final response = await _dio.post(
        '/api/v2/file/generate-url',
        data: {
          'filename': filename,
          'content_type': mimeType,
          'size': fileSize,
          'user_tg_id': TelegramService.instance.id,
          'challenge_id': challengeId,
        },
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Шаг 2: Загрузить файл напрямую в S3
  Future<void> uploadToS3(
    String uploadUrl,
    XFile file,
  ) async {
    try {
      final bytes = await file.readAsBytes();
      final mimeType = file.mimeType ?? 'video/mp4';

      // Создаем отдельный Dio клиент для S3 без интерцепторов
      final s3Dio = Dio();

      await s3Dio.put(
        uploadUrl,
        data: bytes,
        options: Options(
          headers: {
            'Content-Type': mimeType,
          },
        ),
      );
    } on DioException catch (e) {
      throw Exception('Ошибка при загрузке файла в S3: ${e.message}');
    }
  }

  // Шаг 3: Создать запись о файле и получить ключ
  Future<String> confirmS3Upload(
    String s3Key, {
    required int challengeId,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/file/confirm',
        data: {
          's3_key': s3Key,
        },
        queryParameters: {
          'user_tg_id': TelegramService.instance.id,
          'challenge_id': challengeId,
        },
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data['key'] as String;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Комбинированный метод для загрузки видео через S3
  Future<String> uploadVideoToS3(
    XFile file, {
    required int challengeId,
  }) async {
    try {
      final filename = path
          .basename(file.path)
          .replaceAll(RegExp(r'[^\w\s\-.]'), '')
          .replaceAll(RegExp(r'\s+'), '_');

      // Шаг 1: Получить presigned URL
      final s3Data =
          await getS3UploadUrl(filename, file, challengeId: challengeId);
      final uploadUrl = s3Data['link'] as String;
      final s3Key = s3Data['key'] as String;

      // Шаг 2: Загрузить в S3
      await uploadToS3(uploadUrl, file);

      // Шаг 3: Возвращаем key напрямую (возможно confirmS3Upload не нужен)
      return s3Key;
    } catch (e) {
      throw Exception('Ошибка при загрузке видео: $e');
    }
  }

  // Альтернативный метод с подтверждением (если потребуется)
  Future<String> uploadVideoToS3WithConfirm(
    XFile file, {
    required int challengeId,
  }) async {
    try {
      final filename = path
          .basename(file.path)
          .replaceAll(RegExp(r'[^\w\s\-.]'), '')
          .replaceAll(RegExp(r'\s+'), '_');

      // Шаг 1: Получить presigned URL
      final s3Data =
          await getS3UploadUrl(filename, file, challengeId: challengeId);
      final uploadUrl = s3Data['link'] as String;
      final s3Key = s3Data['key'] as String;

      // Шаг 2: Загрузить в S3
      await uploadToS3(uploadUrl, file);

      // Шаг 3: Подтвердить загрузку
      final fileKey = await confirmS3Upload(s3Key, challengeId: challengeId);

      return fileKey;
    } catch (e) {
      throw Exception('Ошибка при загрузке видео: $e');
    }
  }

  Exception _handleDioError(DioException error) {
    if (error.response?.statusCode == 413) {
      return Exception('Файл слишком большой');
    }
    if (error.response?.statusCode == 415) {
      return Exception('Неподдерживаемый формат файла');
    }
    if (error.response?.statusCode == 418) {
      final message = error.response?.data['message'] as String?;
      return Exception(message ?? 'Неверный формат файла');
    }
    return Exception(error.message ?? 'Произошла ошибка при загрузке файла');
  }
}
