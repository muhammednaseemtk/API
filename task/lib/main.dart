import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/user_controller.dart';
import 'package:task/view/user_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserController())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}