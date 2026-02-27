class Movie {
  final int? id;
  final String? posterPath;
  final String? originalTitle;

  Movie({this.id, this.posterPath, this.originalTitle});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      posterPath: json['poster_path'],
      originalTitle: json['original_title'],
    );
  }
}
