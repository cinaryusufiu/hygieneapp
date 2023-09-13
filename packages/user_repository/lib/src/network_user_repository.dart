import 'dart:math';

import 'package:network/request.dart';
import 'package:user_repository/src/entities/auth_entity.dart';
import 'package:user_repository/src/entities/entities.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo_imp.dart';
import 'package:network/network.dart';
import 'user_endpoint.dart';

class NetworkUserRepository implements UserRepositoryImp {
  @override
  Future<User> getMyUser(String myUserId) {
    // TODO: implement getMyUser
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(User user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) async {
    var router = RequestController();
    final serverResponse =
        await router.execute(endpoint: UserEndpoint().signIn(email, password));
    final responseModel =
        ResponseModel<AuthEntity>.fromJson(serverResponse, (authjson) {
      //
      var authmodel = AuthEntity.fromDocument(authjson);
      print(authmodel.token);
    });
    return;
  }

  @override
  Future<User> signUp(User myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<String> uploadPicture(String file, String userId) {
    // TODO: implement uploadPicture
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<User?> get user => throw UnimplementedError();
}
