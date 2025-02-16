import 'package:dio/dio.dart';
import '../models/code_word.dart';

class CodeWordRepository {
  final Dio _dio;

  CodeWordRepository(this._dio);

  Future<CodeWord> getCodeWord() async {
    try {
      final response = await _dio.get('/api/v2/codeword');
      return CodeWord.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          e.message ?? 'Произошла ошибка при получении кодового слова');
    }
  }
}
