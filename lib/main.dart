import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_training/blocs/login/login_cubit.dart';
import 'package:login_training/blocs/welcome/welcome_cubit.dart';
import 'package:login_training/config/routes.dart';
import 'package:login_training/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeCubit>(
          create: (BuildContext context) => WelcomeCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Login Practice',
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.tag,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
