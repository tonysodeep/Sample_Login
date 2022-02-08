import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_training/blocs/login/login_cubit.dart';
import 'package:login_training/screens/home_screen.dart';
import 'package:login_training/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String tag = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
            ),
            TextFormField(
              controller: _passController,
            ),
            BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              if (state is LoginError) {
                return Text(
                  state.loginResponseModel.error,
                  style: const TextStyle(fontSize: 30),
                );
              }
              return const SizedBox();
            }, listener: (context, state) {
              if (state is LoginLoaded) {
                Navigator.popAndPushNamed(context, HomeScreen.tag);
              }
            }),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context)
                    .login(_emailController.text, _passController.text);
              },
              child: const Text('login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.tag);
              },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
