class AppMetadata {
  final List<String> categories;

  AppMetadata({
    required this.categories,
  });

  factory AppMetadata.fromJson(Map<String, dynamic> json) {
    return AppMetadata(
      categories: List<String>.from(json['categories']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
    };
  }
}
