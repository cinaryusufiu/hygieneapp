import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hygieneapp/context/splash/bloc/splash_bloc.dart';
import 'package:hygieneapp/context/splash/view/splash_bottom.dart';

import '../../main/view/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.4).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SplashBackground(subView: buildSubView(context));
  }

  Widget buildSubView(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      builder: (context, state) {
        Widget? widget;
        if (state.status == SplashStatus.loading) {
          widget = const Center(
              child: CupertinoActivityIndicator(
            color: Colors.black,
          ));
        }
        return SplashBottomWidget(
          widget: widget,
          opacity: opacity.value,
        );
      },
      listener: (BuildContext context, SplashState state) {
        if (state.status == SplashStatus.success) {
          Navigator.of(context).pushReplacement(MainPage.route());
        }
      },
    );
  }
}

class _SplashBackground extends StatelessWidget {
  const _SplashBackground({required this.subView});
  final Widget subView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(child: subView)));
  }
}



  // void _init() async {
  //   String? token = await serviceLocator.get<SecureStorage>().getToken();
  //   token?.isNotEmpty ?? false ? navigationPage() : await login();
  // }

  // void navigationPage() {
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  // }

  // Future<void> login() async {
  //   UserRepository repository = serviceLocator.get<UserRepository>();
  //   repository
  //       .signIn("mhmetgnes@gmail.com", ".Hygiene1")
  //       .then((value) => _setResponse())
  //       .onError((error, stackTrace) => _setError(error.toString()));
  // }

  // void _setResponse() {}

  // void _setError(String msg) {}