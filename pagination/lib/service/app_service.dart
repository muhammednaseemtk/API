import 'package:dio/dio.dart';
import 'package:pagination/core/app_url.dart';
import 'package:pagination/model/movie.dart';
import 'package:pagination/model/movie_model.dart';

class AppService {
  final Dio dio = Dio();

  Future<List<Movie>> fetchMovie(int page) async {
    final response = await dio.get(
      AppUrl.discover,
      queryParameters: {'page': page},
    );

    if (response.statusCode == 200 && response.data != null) {
      final model = MovieModel.fromJson(response.data);
      return model.results ?? [];
    } else {
      throw Exception('Failed to load');
    }
  }
}