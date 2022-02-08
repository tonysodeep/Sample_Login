import 'package:bloc/bloc.dart';
import 'package:login_training/models/login.dart';
import 'package:login_training/repositories/login_signup_repo.dart';
import 'package:login_training/services/login_signup_service.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginSignupRepo _loginSignupRepo = LoginSignupRepoImpl();

  LoginCubit() : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());
    final result = await _loginSignupRepo.sendLoginRequest(username, password);
    if (result.error.isEmpty) {
      emit(LoginLoaded(loginResponseModel: result));
    } else {
      emit(LoginError(loginResponseModel: result));
    }
  }
}
