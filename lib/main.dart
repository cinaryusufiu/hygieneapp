import 'package:flutter/material.dart';
import 'package:user_repository/src/network_user_repository.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }

  void _init() async {
    await login();
  }

  Future<void> login() async {
    NetworkUserRepository repository = NetworkUserRepository();
    repository
        .signIn("mhmetgnes@gmail.com", ".Hygiene1")
        .then((value) => _setResponse())
        .onError((error, stackTrace) => _setError(error.toString()));
  }

  void _setResponse() {}

  void _setError(String msg) {}
}
