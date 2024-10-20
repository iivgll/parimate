class ChallengeModel {
  final String name;
  final DateTime date;
  final String imageUrl;

  ChallengeModel({
    required this.name,
    required this.date,
    required this.imageUrl,
  });
}

enum ChallengeView { mine, newChallenges }
