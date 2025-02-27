import 'dart:js' as js;
import 'dart:html' as html;

import 'package:parimate/app/app_logger.dart';

class TelegramService {
  static final TelegramService instance = TelegramService._();
  final _webApp = js.context['Telegram']?['WebApp'];

  TelegramService._() {
    _initUser();
  }

  String id = '';
  String firstName = '';
  String lastName = '';
  String username = '';
  String languageCode = '';
  String photoUrl = '';

  void _initUser() {
    final initData = _webApp?['initDataUnsafe'];
    final user = initData?['user'];

    if (user != null) {
      id = user['id']?.toString() ?? '44';
      firstName = user['first_name'] ?? 'Ivan';
      lastName = user['last_name'] ?? 'Gladko';
      username = user['username'] ?? 'iivgll';
      languageCode = user['language_code'] ?? 'ru';
      photoUrl = user['photo_url'] ??
          'https://upload.wikimedia.org/wikipedia/commons/c/c3/NGC_4414_%28NASA-med%29.jpg';
    } else {
      id = '44';
      firstName = 'Ivan';
      lastName = 'Test';
      username = 'iivgll';
      languageCode = 'ru';
      photoUrl =
          'https://upload.wikimedia.org/wikipedia/commons/c/c3/NGC_4414_%28NASA-med%29.jpg';
    }
  }

  // Получение информации о запуске приложения
  Map<String, dynamic> getLaunchInfo() {
    final result = <String, dynamic>{};

    // Получаем текущий URL
    final currentUrl = html.window.location.href;
    result['url'] = currentUrl;

    // Получаем параметры запроса
    final params = <String, dynamic>{};
    final uri = Uri.parse(currentUrl);
    uri.queryParameters.forEach((key, value) {
      params[key] = value;
    });
    result['params'] = params;

    // Получаем User Agent
    result['userAgent'] = html.window.navigator.userAgent;

    // Получаем данные инициализации Telegram
    if (_webApp != null) {
      final initData = _webApp['initDataUnsafe'];
      final user = initData?['user'];

      if (user != null) {
        id = user['id']?.toString() ?? '44';
        firstName = user['first_name'] ?? 'Ivan';
        lastName = user['last_name'] ?? 'Gladko';
        username = user['username'] ?? 'iivgll';
        languageCode = user['language_code'] ?? 'ru';
        photoUrl = user['photo_url'] ??
            'https://t.me/i/userpic/320/AuC2ESWo7RRi53GbvgI8hyj17TL0jSCl4YT4M9Hnt_4.svg';
      } else {
        id = '441';
        firstName = 'Ivan';
        lastName = 'Test';
        username = 'iivgll4';
        languageCode = 'ru';
        photoUrl =
            'https://t.me/i/userpic/320/AuC2ESWo7RRi53GbvgI8hyj17TL0jSCl4YT4M9Hnt_4.png';
      }

      // Добавляем информацию о пользователе в результат
      result['user'] = {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'languageCode': languageCode,
        'photoUrl': photoUrl,
      };

      final initDataStr = _webApp['initData'];
      if (initDataStr != null &&
          initDataStr is String &&
          initDataStr.isNotEmpty) {
        result['telegramInitData'] = initDataStr;
      }

      AppLogger.log(
          'Init User Data: id ${id}, firstName ${firstName}, lastName ${lastName}, username ${username}, languageCode ${languageCode}, photoUrl ${photoUrl}');
      // Получаем платформу
      final platform = _webApp['platform'];
      if (platform != null) {
        result['telegramPlatform'] = platform;
      }
    }

    return result;
  }

  void ready() => _webApp?.callMethod('ready');

  void expand() => _webApp?.callMethod('expand');

  void close() => _webApp?.callMethod('close');
}
