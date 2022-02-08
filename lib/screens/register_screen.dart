import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_training/blocs/login/login_cubit.dart';
import 'package:login_training/models/user.dart';
import 'package:login_training/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String tag = 'register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: 'username'),
              controller: _usernameController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'password'),
              controller: _passwordController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'email'),
              controller: _emailController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'phone'),
              controller: _phoneController,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).signup(
                  User(
                    userName: _usernameController.text,
                    password: _passwordController.text,
                    email: _emailController.text,
                    phone: double.parse(_phoneController.text),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
            BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
              if (state is Loading) {
                return const CircularProgressIndicator();
              } else if (state is SignUpError) {
                return const Text('error');
              }
              return const SizedBox();
            }, listener: (context, state) {
              if (state is SignUpSuccess) {
                Navigator.popAndPushNamed(context, LoginScreen.tag);
              }
            })
          ],
        ),
      ),
    );
  }
}
