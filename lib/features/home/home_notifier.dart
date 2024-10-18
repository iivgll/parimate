import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<int> {
  HomeNotifier() : super(0);

  void setIndex(int index) => state = index;
}
