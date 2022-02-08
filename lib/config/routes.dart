import 'package:flutter/material.dart';
import 'package:login_training/screens/home_screen.dart';
import 'package:login_training/screens/login_screen.dart';
import 'package:login_training/screens/register_screen.dart';
import 'package:login_training/screens/welcome_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    var routes = <String, WidgetBuilder>{
      WelcomeScreen.tag: (_) => const WelcomeScreen(),
      LoginScreen.tag: (_) => const LoginScreen(),
      RegisterScreen.tag: (_) => const RegisterScreen(),
      HomeScreen.tag: (_) => const HomeScreen(),
    };
    return routes;
  }
}
