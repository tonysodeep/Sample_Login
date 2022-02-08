import 'package:flutter/material.dart';
import 'package:login_training/config/routes.dart';
import 'package:login_training/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Practice',
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.tag,
      routes: AppRoutes.getRoutes(),
    );
  }
}
