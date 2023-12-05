import 'package:flutter/material.dart';
import 'package:hygieneapp/context/home/models/home_section_title_model.dart';
import 'section_title_view.dart';

class SectionView extends StatelessWidget {
  final double height;
  final Widget child;
  final HomeSectionTitleModel titleModel;

  const SectionView({
    super.key,
    required this.height,
    required this.child,
    required this.titleModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          SectionTitleView(titleModel: titleModel),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
