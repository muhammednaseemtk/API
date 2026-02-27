import 'package:flutter/material.dart';
import 'package:pagination/model/movie.dart';
import 'package:pagination/service/app_service.dart';

class AppController extends ChangeNotifier {
  final AppService service = AppService();

  List<Movie> movies = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> fetchMovies() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    notifyListeners();

    final newMovies = await service.fetchMovie(page);

    if (newMovies.isNotEmpty) {
      movies.addAll(newMovies);
      page++;
    } else {
      hasMore = false;
    }

    isLoading = false;
    notifyListeners();
  }
}