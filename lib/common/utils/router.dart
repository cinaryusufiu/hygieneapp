import 'package:flutter/material.dart';
import 'package:hygieneapp/context/main/view/main_page.dart';
import 'package:hygieneapp/context/login/view/login_page.dart';
import 'package:hygieneapp/context/onboarding/onboarding_page.dart';
import 'package:hygieneapp/context/register/register_page.dart';
import 'package:hygieneapp/context/splash/view/splash_page.dart';
import 'package:hygieneapp/context/welcome/welcome_page.dart';

enum Routes { splash, welcome, onboarding, login, register, home }

class _Paths {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.onboarding: _Paths.onboarding,
    Routes.welcome: _Paths.welcome,
    Routes.login: _Paths.login,
    Routes.register: _Paths.register
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashPage());

      case _Paths.welcome:
        return FadeRoute(page: const WelcomePage());

      case _Paths.onboarding:
        return FadeRoute(page: const OnboardingPage());

      case _Paths.login:
        return FadeRoute(page: const LoginPage());

      case _Paths.register:
        return FadeRoute(page: const RegisterPage());

      case _Paths.home:
      default:
        return FadeRoute(page: const MainPage());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  final Widget page;
}
