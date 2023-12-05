import 'dart:async';

import 'package:authentication_repository/repo/authentication_endpoint.dart';
import 'package:core/secure_storage.dart';
import 'package:network/network.dart';
import 'package:network/request.dart';

import '../entities/auth_entity.dart';
import 'authentication_repo_imp.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository implements AuthenticationRepositoryImp {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    String? token = await SecureStorage().getToken();
    yield token?.isNotEmpty ?? false
        ? AuthenticationStatus.authenticated
        : AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    var router = RequestController();
    final serverResponse = await router.execute(
        endpoint: AuthenticationEndpoint().logIn(email, password));
    final responseModel =
        ResponseModel<AuthEntity>.fromJson(serverResponse, (authjson) {
      return AuthEntity.fromDocument(authjson);
    });
    await SecureStorage().persistEmailAndToken(
        responseModel.data?.userEntity?.email ?? "",
        responseModel.data?.token ?? "");
    _controller.add(AuthenticationStatus.authenticated);
    return;
  }

  @override
  Future<void> logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    throw UnimplementedError();
  }

  void dispose() => _controller.close();
}
