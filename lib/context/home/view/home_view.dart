import 'package:flutter/material.dart';
import 'package:hygieneapp/context/home/view/Category/most_popular_view.dart';
import '../models/home_section_title_model.dart';
import 'Category/distance_view.dart';
import 'Category/section_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Colors.red,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 63, 22, 22)),
              height: 80,
            ),
          ),
          const SliverToBoxAdapter(
              child: SectionView(
            height: 280,
            titleModel: HomeSectionTitleModel(
                textTitle: "Most Popular", buttonTitle: "See All"),
            child: MostPopularView(),
          )),
          const SliverToBoxAdapter(
              child: SectionView(
            height: 180,
            titleModel: HomeSectionTitleModel(
                textTitle: "Distance", buttonTitle: "See All"),
            child: DistanceView(),
          )),
          // const SliverToBoxAdapter(child: HomeCategorySectionView())
        ]));
  }
}
