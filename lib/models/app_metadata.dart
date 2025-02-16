class AppMetadata {
  final List<String> categories;
  final String? codeWord;

  const AppMetadata({
    required this.categories,
    this.codeWord,
  });

  factory AppMetadata.fromJson(Map<String, dynamic> json) {
    return AppMetadata(
      categories: List<String>.from(json['categories']),
      codeWord: json['word'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
      'word': codeWord,
    };
  }
}
