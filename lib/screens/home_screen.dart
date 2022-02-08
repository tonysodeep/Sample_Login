import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String tag = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('home Screen'),
        ),
      ),
    );
  }
}
