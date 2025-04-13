import 'package:dio/dio.dart';
import 'package:parimate/main.dart';
import 'package:parimate/services/telegram_service.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class ApiClient {
  final String baseUrl;
  late final Dio dio;

  // Полная строка данных инициализации для резервного использования
  // FIXME: Это строка для того чтобы работало из конкретного бота и для тест
  // если убрать бекенд сломается и не будет принимать данные
  static const String _fallbackInitData =
      'query_id=AAEhvk9LAAAAACG-T0vuNhyK&user=%7B%22id%22%3A1263517217%2C%22first_name%22%3A%22IVAN%22%2C%22last_name%22%3A%22%22%2C%22username%22%3A%22iivgll%22%2C%22language_code%22%3A%22ru%22%2C%22allows_write_to_pm%22%3Atrue%2C%22photo_url%22%3A%22https%3A%5C%2F%5C%2Ft.me%5C%2Fi%5C%2Fuserpic%5C%2F320%5C%2FAuC2ESWo7RRi53GbvgI8hyj17TL0jSCl4YT4M9Hnt_4.svg%22%7D&auth_date=1741071985&signature=qRErTzxL5zgxOYl0aDEtCDA74xl5gmJatQYeJYonlH2l4cBQLqUHnPOp3IaXWGZxPt96KkpdDRkMIyt3MBLHCg&hash=ad0c011d9e2e307e8367d0bb9fa213e3026c1990d7a86711ae88b1d81cb3d72f';

  ApiClient({required this.baseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final launchInfo = TelegramService.instance.getLaunchInfo();
          var initData = launchInfo['telegramInitData'];

          // Если данных нет, используем резервные
          if (initData == null || initData.isEmpty) {
            initData = _fallbackInitData;
          }

          // Добавляем заголовок с полной строкой данных инициализации
          options.headers['X-Telegram-Init-Data'] = initData;

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
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
