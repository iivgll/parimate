import 'dart:js' as js;

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

  void ready() => _webApp?.callMethod('ready');
  void expand() => _webApp?.callMethod('expand');
  void close() => _webApp?.callMethod('close');
}
