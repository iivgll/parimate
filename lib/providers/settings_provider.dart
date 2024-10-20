import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/settings/settings_notifier.dart';

final settingsNotifier = StateNotifierProvider<SettingsNotifier, int>((ref) {
  return SettingsNotifier();
});
