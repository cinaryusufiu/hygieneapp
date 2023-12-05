abstract class AuthenticationRepositoryImp {
  Future<void> logIn({required String email, required String password});
  Future<void> logOut();
}
