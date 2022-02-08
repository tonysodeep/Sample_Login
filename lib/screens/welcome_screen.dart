import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_training/blocs/welcome/welcome_cubit.dart';
import 'package:login_training/screens/home_screen.dart';
import 'package:login_training/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String tag = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.red,
            ),
            BlocConsumer<WelcomeCubit,WelcomeState>(
              builder: (context, state) {
                if (state is WelcomeLoading) {
                  return const CircularProgressIndicator();
                }
                return const SizedBox();
              },
              listener: (context, state) {
                if (state is WelcomeLogged) {
                  Navigator.popAndPushNamed(context, HomeScreen.tag);
                } else {
                  Navigator.popAndPushNamed(context, LoginScreen.tag);
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<WelcomeCubit>(context).checkAuthentication();
              },
              child: const Text('let get start'),
            )
          ],
        ),
      ),
    );
  }
}
