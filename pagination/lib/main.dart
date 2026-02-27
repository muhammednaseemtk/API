import 'package:flutter/material.dart';
import 'package:pagination/controller/app_controller.dart';
import 'package:pagination/view/movie_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppController()..fetchMovies())
  ], child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieScreen(),
    );
  }
}