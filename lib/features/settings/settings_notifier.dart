import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsNotifier extends StateNotifier<int> {
  SettingsNotifier() : super(0);

  void setIndex(int index) => state = index;
}
