part of 'welcome_cubit.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState{}

class WelcomeLogged extends WelcomeState{}

class WelcomeNotLogged extends WelcomeState{}
