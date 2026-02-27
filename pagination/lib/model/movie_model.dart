import 'package:pagination/model/movie.dart';

class MovieModel {
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  MovieModel({this.page, this.results, this.totalPages, this.totalResults});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
