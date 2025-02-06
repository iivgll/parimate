class ReminderSettings {
  final bool isEnabled;
  final Map<int, int> reminderTimes;

  const ReminderSettings({
    this.isEnabled = false,
    Map<int, int>? reminderTimes,
  }) : reminderTimes = reminderTimes ?? const {};

  ReminderSettings copyWith({
    bool? isEnabled,
    Map<int, int>? reminderTimes,
  }) {
    return ReminderSettings(
      isEnabled: isEnabled ?? this.isEnabled,
      reminderTimes: reminderTimes ?? this.reminderTimes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReminderSettings &&
        other.isEnabled == isEnabled &&
        other.reminderTimes == reminderTimes;
  }

  @override
  int get hashCode => isEnabled.hashCode ^ reminderTimes.hashCode;
}
