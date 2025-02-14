enum ChallengeType {
  personal,
  group;

  String get title {
    switch (this) {
      case ChallengeType.personal:
        return 'Персональный';
      case ChallengeType.group:
        return 'Групповой';
    }
  }
}

enum ConfirmationType {
  text('TEXT'),
  photo('PHOTO'),
  video('VIDEO');

  final String value;
  const ConfirmationType(this.value);

  static ConfirmationType fromString(String value) {
    return ConfirmationType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => ConfirmationType.photo,
    );
  }
}
