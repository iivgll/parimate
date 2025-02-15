import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class FileRepository {
  final Dio _dio;

  FileRepository(this._dio);

  Future<String> uploadFile(
    XFile file, {
    required String userTgId,
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
          'user_tg_id': userTgId,
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
