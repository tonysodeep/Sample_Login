import 'package:login_training/models/login.dart';
import 'package:login_training/models/user.dart';

abstract class LoginSignupRepo{
  Future<LoginResponseModel> sendLoginRequest(String username, String password);
  Future<bool> sendSignupRequest(User user);
}