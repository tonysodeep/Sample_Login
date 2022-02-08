import 'package:login_training/constants/localdb_constant.dart';
import 'package:login_training/models/login.dart';
import 'package:login_training/repositories/welcome_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeRepoImpl extends WelcomeRepo {
  AuthenticationService authenticationService = AuthenticationService();
  @override
  Future<bool> checkAuthentication() async {
    final String? token = await authenticationService.getToken();
    if(token == null){
      return false;
    }
    return true;
  }

  @override
  Future<void> signOut() async {
    await authenticationService.clearToken();
  }
}

class AuthenticationService {
  late SharedPreferences pref;

  Future<void> setToken(LoginResponseModel loginResponseModel) async {
    pref = await SharedPreferences.getInstance();
    pref.setString(LocalDBConstant.cachedToken, loginResponseModel.token);
  }

  Future<String?> getToken() async {
    pref = await SharedPreferences.getInstance();
    String? token = pref.getString(LocalDBConstant.cachedToken);
    return token;
  }

  Future<void> clearToken() async{
    pref = await SharedPreferences.getInstance();
    pref.clear();
}
}
