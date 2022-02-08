import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_training/models/login.dart';
import 'package:login_training/models/user.dart';
import 'package:login_training/repositories/login_signup_repo.dart';
import 'package:login_training/services/authentication_service.dart';

class LoginSignupRepoImpl extends LoginSignupRepo {
  final LoginSignupService _loginSignupService = LoginSignupService();

  @override
  Future<LoginResponseModel> sendLoginRequest(
      String username, String password) async {
    final result = await _loginSignupService.getUserSignIn(username, password);
    return result;
  }

  @override
  Future<bool> sendSignupRequest(User user) async {
    final result = await _loginSignupService.getUserSignUp(user);
    return result;
  }
}

class LoginSignupService {
  final http.Client client = http.Client();

  Future<LoginResponseModel> getUserSignIn(
    String username,
    String password,
  ) async {
    final response = await client.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        "username": username,
        "password": password,
      },
    );
    final loginResponse =
        LoginResponseModel.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      AuthenticationService().setToken(loginResponse);
    }
    return loginResponse;
  }

  Future<bool> getUserSignUp(User user) async {
    final response = await client.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      body: user.toJson(),
      encoding: Encoding.getByName('uft-8'),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
