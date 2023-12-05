import 'package:user_repository/models/user.dart';

abstract class UserRepositoryImp {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<User> signUp(User myUser, String password);

  Future<void> resetPassword(String email);

  Future<void> setUserData(User user);

  Future<User> getMyUser();

  Future<String> uploadPicture(String file, String userId);
}
