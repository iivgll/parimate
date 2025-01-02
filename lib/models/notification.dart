import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationSchema with _$NotificationSchema {
  const factory NotificationSchema({
    required int id,
    required int hours,
    required int minutes,
    required bool archived,
  }) = _NotificationSchema;

  factory NotificationSchema.fromJson(Map<String, dynamic> json) =>
      _$NotificationSchemaFromJson(json);
}
