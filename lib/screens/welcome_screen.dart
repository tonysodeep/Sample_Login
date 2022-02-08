import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String tag = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
