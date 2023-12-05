import 'package:authentication_repository/repo/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hygieneapp/context/splash/view/splash_page.dart';
import 'package:hygieneapp/common/utils/locater.dart';
import 'package:hygieneapp/context/theme/theme.dart';
import 'package:user_repository/repo/user_repository.dart';
import 'context/authentication/bloc/authentication_bloc.dart';

class HygieneApp extends StatefulWidget {
  const HygieneApp({super.key});

  @override
  State<HygieneApp> createState() => _HygieneAppState();
}

class _HygieneAppState extends State<HygieneApp> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    // SecureStorage().deleteAll();
    _authenticationRepository = serviceLocator.get<AuthenticationRepository>();
    _userRepository = serviceLocator.get<UserRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        ),
        child: const AppView(),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  //NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      navigatorKey: _navigatorKey,
      // builder: (context, child) {
      //   return BlocListener<AuthenticationBloc, AuthenticationState>(
      //     listener: (context, state) {
      //       switch (state.status) {
      //         case AuthenticationStatus.authenticated:
      //           _navigator.pushAndRemoveUntil<void>(
      //             HomePage.route(),
      //             (route) => false,
      //           );
      //         case AuthenticationStatus.unauthenticated:
      //           _navigator.pushAndRemoveUntil<void>(
      //             LoginPage.route(),
      //             (route) => false,
      //           );
      //         case AuthenticationStatus.unknown:
      //           break;
      //       }
      //     },
      //     child: child,
      //   );
      // },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
