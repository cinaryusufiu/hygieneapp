import 'package:flutter/material.dart';
import 'package:hygieneapp/common/utils/app_properties.dart';

import '../../models/home_section_title_model.dart';

class SectionTitleView extends StatelessWidget {
  final HomeSectionTitleModel titleModel;

  const SectionTitleView({super.key, required this.titleModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            titleModel.textTitle,
            style: defaultTextStyle(14),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              titleModel.buttonTitle,
              style: defaultTextStyle(14),
            ),
          )
        ]),
      ),
    );
  }
}
