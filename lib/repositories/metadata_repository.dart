import 'package:dio/dio.dart';
import '../models/app_metadata.dart';

class MetadataRepository {
  final Dio _dio;

  MetadataRepository(this._dio);

  Future<AppMetadata> getMetadata() async {
    try {
      final response = await _dio.get('/api/v2/metadata/');
      return AppMetadata.fromJson(response.data);
    } catch (e) {
      print('MetadataRepository: error $e');
      rethrow;
    }
  }
}
