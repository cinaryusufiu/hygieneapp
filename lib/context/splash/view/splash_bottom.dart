import 'package:flutter/material.dart';

class SplashBottomWidget extends StatelessWidget {
  const SplashBottomWidget({
    super.key,
    this.widget,
    required this.opacity,
  });

  final double opacity;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Opacity(
              opacity: opacity, child: Image.asset('assets/images/logo.png')),
        ),
        widget ?? Container(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: const TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'Powered by hygieneapp'),
                  TextSpan(
                      text: '.io',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
          ),
        )
      ],
    );
  }
}
