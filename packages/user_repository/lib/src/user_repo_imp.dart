import 'package:user_repository/src/models/user.dart';

abstract class UserRepositoryImp {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<User> signUp(User myUser, String password);

  Future<void> resetPassword(String email);

  Future<void> setUserData(User user);

  Future<User> getMyUser(String myUserId);

  Future<String> uploadPicture(String file, String userId);
}


// // ignore_for_file: constant_identifier_names


// enum Status { LOADING, COMPLETED, ERROR }
