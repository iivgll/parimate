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
