import 'package:bloc/bloc.dart';
import 'package:login_training/repositories/welcome_repo.dart';
import 'package:login_training/services/authentication_service.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final WelcomeRepo welcomeRepo = WelcomeRepoImpl();

  WelcomeCubit() : super(WelcomeInitial());

  testAuthen() async {
    final result = await welcomeRepo.checkAuthentication();
    print(result);
  }


}
