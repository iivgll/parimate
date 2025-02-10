class CreatedChallengeResponse {
  final int id;

  CreatedChallengeResponse({required this.id});

  factory CreatedChallengeResponse.fromJson(Map<String, dynamic> json) {
    return CreatedChallengeResponse(
      id: json['challenge_id'],
    );
  }
}
