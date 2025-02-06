import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderSettings {
  final bool isEnabled;
  final Map<int, int> reminderTimes; // номер напоминания -> минуты

  ReminderSettings({
    this.isEnabled = false,
    Map<int, int>? reminderTimes,
  }) : reminderTimes = reminderTimes ?? {};

  ReminderSettings copyWith({
    bool? isEnabled,
    Map<int, int>? reminderTimes,
  }) {
    return ReminderSettings(
      isEnabled: isEnabled ?? this.isEnabled,
      reminderTimes: reminderTimes ?? this.reminderTimes,
    );
  }
}

class SettingsNotifier extends StateNotifier<ReminderSettings> {
  SettingsNotifier() : super(ReminderSettings());

  void toggleReminders(bool value) {
    state = state.copyWith(isEnabled: value);
  }

  void setReminderTime(int reminderNumber, int minutes) {
    final newTimes = Map<int, int>.from(state.reminderTimes);
    newTimes[reminderNumber] = minutes;
    state = state.copyWith(reminderTimes: newTimes);
  }

  String getReminderTime(int reminderNumber) {
    final minutes = state.reminderTimes[reminderNumber];
    return minutes != null ? '$minutes мин' : 'Выбрать';
  }
}
