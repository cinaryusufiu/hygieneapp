import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/faq_bloc.dart';
import 'faq_view.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const FaqPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FaqBloc(faqsRepository: FaqsRepository())
        ..add(const FaqGetItemsRequested()),
      child: const FaqView(),
    );
  }
}
