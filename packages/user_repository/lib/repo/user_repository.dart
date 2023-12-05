import 'package:authentication_repository/entities/auth_entity.dart';
import 'package:core/secure_storage.dart';
import 'package:network/request.dart';
import 'package:user_repository/models/user.dart';
import 'package:user_repository/repo/user_repo_imp.dart';
import 'package:network/network.dart';
import 'user_endpoint.dart';

class UserRepository implements UserRepositoryImp {
  @override
  Future<User> getMyUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) async {
    var router = RequestController();
    final serverResponse =
        await router.execute(endpoint: UserEndpoint().signIn(email, password));
    final responseModel =
        ResponseModel<AuthEntity>.fromJson(serverResponse, (authjson) {
      return AuthEntity.fromDocument(authjson);
    });
    await SecureStorage().persistEmailAndToken(
        responseModel.data?.userEntity?.email ?? "",
        responseModel.data?.token ?? "");
  }

  @override
  Future<User> signUp(User myUser, String password) {
    throw UnimplementedError();
  }

  @override
  Future<String> uploadPicture(String file, String userId) {
    throw UnimplementedError();
  }

  @override
  Stream<User?> get user => throw UnimplementedError();
}
