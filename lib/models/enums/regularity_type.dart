import 'package:freezed_annotation/freezed_annotation.dart';

enum RegularityType {
  @JsonValue('TIMES_PER_WEEK')
  timesPerWeek,
  @JsonValue('TIMES_PER_DAY')
  timesPerDay,
  @JsonValue('ONCE')
  once,
  @JsonValue('CONCRETE_DAYS')
  concreteDays,
}
