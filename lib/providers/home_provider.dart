import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/home/home_notifier.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, int>((ref) {
  return HomeNotifier();
});
