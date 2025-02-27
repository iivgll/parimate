import 'package:parimate/main.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppLogger {
  static final Talker _talker = Talker(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      maxHistoryItems: 1000,
      useConsoleLogs: true,
    ),
  );

  static void log(dynamic message) {
    talker.info(message);
  }

  static void error(dynamic message) {
    talker.error(message);
  }

  static void debug(dynamic message) {
    talker.debug(message);
  }

  static void warning(dynamic message) {
    talker.warning(message);
  }

  static Talker get instance => _talker;
}
