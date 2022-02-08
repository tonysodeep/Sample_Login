part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginLoaded({required this.loginResponseModel});
}

class LoginError extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginError({required this.loginResponseModel});
}
