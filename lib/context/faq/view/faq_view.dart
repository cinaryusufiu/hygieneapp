import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hygieneapp/common/utils/app_properties.dart';
import 'package:hygieneapp/context/faq/bloc/faq_bloc.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Settings', style: TextStyle(color: darkGrey)),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: bodyBuilder());
  }

  BlocBuilder<FaqBloc, FaqState> bodyBuilder() {
    return BlocBuilder<FaqBloc, FaqState>(builder: (context, state) {
      if (state.status == FaqStatus.loading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state.faqs.isEmpty) {
        return const Placeholder(
          child: Text("Not found data"),
        );
      }
      if (state.status == FaqStatus.success) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(children: <Widget>[
            const Text(
              'FAQ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            ...state.faqs
                .map((faq) => ExpansionTile(
                        tilePadding: const EdgeInsets.only(left: 0),
                        title: Text(
                          faq.title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                        children: [
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              color: const Color(0xffFAF1E2),
                              child: Text(faq.content,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)))
                        ]))
                .toList(),
          ]),
        ));
      } else {
        return Center(
          child: Text(
            'FaqOverviewEmptyText',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      }
    });
  }
}
