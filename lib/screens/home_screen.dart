import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_training/blocs/welcome/welcome_cubit.dart';
import 'package:login_training/screens/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String tag = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<WelcomeCubit, WelcomeState>(
          listener: (context, state) {
            if (state is WelcomeClear) {
              Navigator.popAndPushNamed(context, WelcomeScreen.tag);
            }
          },
          child: Column(
            children: [
              Center(
                child: Text('home Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WelcomeCubit>(context).logout();
                },
                child: Text('logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
