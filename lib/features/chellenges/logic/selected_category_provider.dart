import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  String? build() => null;

  void update(String? Function(String?) callback) {
    state = callback(state);
  }
}
