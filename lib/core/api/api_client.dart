import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class ApiClient {
  final String baseUrl;
  late final Dio dio;

  ApiClient({required this.baseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    )..interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printRequestData: true,
            printErrorData: true,
            printErrorHeaders: true,
            printErrorMessage: true,
            printResponseData: true,
            printResponseMessage: true,
          ),
        ),
      );
  }
}
