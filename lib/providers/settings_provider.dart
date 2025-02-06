import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/settings/settings_notifier.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, ReminderSettings>((ref) {
  return SettingsNotifier();
});
