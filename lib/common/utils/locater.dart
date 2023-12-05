import 'package:authentication_repository/repo/authentication_repository.dart';
import 'package:core/secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:user_repository/repo/constants.dart';

final serviceLocator = GetIt.instance;

void setUpRegister() {
  serviceLocator.registerSingleton<SecureStorage>(SecureStorage());

  serviceLocator.registerSingleton<UserRepository>(UserRepository());

  serviceLocator.registerSingleton<AuthenticationRepository>(
      AuthenticationRepository(),
      signalsReady: true);
}
