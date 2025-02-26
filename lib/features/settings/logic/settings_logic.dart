import 'package:parimate/app/repository_providers.dart';
import 'package:parimate/features/initializer/app_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/settings_state.dart';
import '../../../repositories/notification_repository.dart';

part 'settings_logic.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  late final NotificationRepository _notificationRepository;

  @override
  ReminderSettings build() {
    _notificationRepository = ref.read(notificationRepositoryProvider);
    _initializeNotifications();
    return const ReminderSettings();
  }

  Future<void> _initializeNotifications() async {
    try {
      final user = ref.read(userProvider);
      if (user == null) return;

      final notifications = await _notificationRepository.getNotifications();

      if (notifications.any((n) => !n.archived)) {
        final reminderTimes = {
          for (var i = 0; i < notifications.length; i++)
            if (!notifications[i].archived)
              i + 1: notifications[i].hours * 60 + notifications[i].minutes,
        };

        state = state.copyWith(
          isEnabled: true,
          reminderTimes: reminderTimes,
        );
      }
    } catch (e) {
      // Обработка ошибок
    }
  }

  Future<void> toggleReminders(bool value) async {
    try {
      final user = ref.read(userProvider);
      if (user == null) return;

      if (value) {
        await _notificationRepository.activateNotifications();
        final notifications = await _notificationRepository.getNotifications();

        final reminderTimes = {
          for (var i = 0; i < notifications.length; i++)
            i + 1: notifications[i].hours * 60 + notifications[i].minutes,
        };

        state = state.copyWith(
          isEnabled: true,
          reminderTimes: reminderTimes,
        );
      } else {
        await _notificationRepository.disableNotifications();
        state = state.copyWith(
          isEnabled: false,
          reminderTimes: {},
        );
      }
    } catch (e) {
      // Обработка ошибок
    }
  }

  Future<void> setReminderTime(int reminderNumber, int minutes) async {
    try {
      final user = ref.read(userProvider);
      if (user == null) return;

      // Удаляем старое уведомление если оно есть
      final notifications = await _notificationRepository.getNotifications();

      if (reminderNumber <= notifications.length) {
        await _notificationRepository.deleteNotification(
          notificationId: notifications[reminderNumber - 1].id,
        );
      }

      // Создаем новое уведомление
      await _notificationRepository.createNotification(
        hours: minutes ~/ 60,
        minutes: minutes % 60,
      );

      final newTimes = Map<int, int>.from(state.reminderTimes);
      newTimes[reminderNumber] = minutes;
      state = state.copyWith(reminderTimes: newTimes);
    } catch (e) {
      // Обработка ошибок
    }
  }

  String getReminderTime(int reminderNumber) {
    final totalMinutes = state.reminderTimes[reminderNumber];
    if (totalMinutes == null) return 'Выбрать';
    return '$totalMinutes мин';
  }
}
