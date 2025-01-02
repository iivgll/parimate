import 'package:dio/dio.dart';
import 'package:parimate/repositories/user_repository.dart';
import '../models/code_word.dart';

class CodeWordRepository {
  final Dio _dio;

  CodeWordRepository(this._dio);

  Future<List<CodeWordSchema>> getCodeWord() async {
    try {
      final response = await _dio.get('/api/v2/codeword');
      return (response.data as List)
          .map((json) => CodeWordSchema.fromJson(json))
          .toList();
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
