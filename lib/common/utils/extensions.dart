import 'dart:ui';

extension ToColorFilter on Color {
  ColorFilter? get toColorFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}

extension CoinWordFormExtension on int {
  String coinWordForm() {
    int number = abs() % 100;
    int num = number % 10;

    if (number > 10 && number < 20) {
      return 'монет';
    }
    if (num > 1 && num < 5) {
      return 'монеты';
    }
    if (num == 1) {
      return 'монета';
    }
    return 'монет';
  }
}
