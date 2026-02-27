import 'package:flutter/material.dart';
import 'package:pagination/controller/app_controller.dart';
import 'package:pagination/core/app_url.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        title: const Text(
          'Movie Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),

      body: Consumer<AppController>(
        builder: (context, controller, _) {
          if (controller.movies.isEmpty && controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }

          if (controller.movies.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                controller.fetchMovies();
              }
              return false;
            },
            child: ListView.builder(
              itemCount:
                  controller.movies.length + (controller.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= controller.movies.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator(color: Colors.red,)),
                  );
                }

                final movie = controller.movies[index];

                return Card(
                  color: Colors.redAccent[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        movie.posterPath != null
                            ? Image.network(
                                '${AppUrl.posterurl}${movie.posterPath}',
                                width: 120,
                                height: 180,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 120,
                                height: 180,
                                color: Colors.black12,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  size: 40,
                                ),
                              ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            movie.originalTitle ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
