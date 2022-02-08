abstract class WelcomeRepo{
  Future<bool> checkAuthentication();
  Future<void> signOut();
}