import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/view/view.dart';
import '../cubit/main_cubit.dart';
import '../../faq/view/view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((MainCubit cubit) => cubit.state.tab);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      body: IndexedStack(
          index: selectedTab.index,
          children: const [HomePage(), TaskPage(), FaqPage()]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 1),
            _HomeTabButton(
                groupValue: selectedTab,
                value: MainTab.home,
                icon: const Icon(Icons.home)),
            const Spacer(flex: 2),
            _HomeTabButton(
                groupValue: selectedTab,
                value: MainTab.task,
                icon: const Icon(Icons.list_rounded)),
            const Spacer(flex: 2),
            _HomeTabButton(
                groupValue: selectedTab,
                value: MainTab.profile,
                icon: const Icon(Icons.person_2_rounded)),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Task Page"),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile Page"),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton(
      {required this.groupValue, required this.value, required this.icon});

  final MainTab groupValue;
  final MainTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<MainCubit>().setTab(value),
        iconSize: 32,
        color: groupValue != value
            ? null
            : Theme.of(context).colorScheme.secondary,
        icon: icon);
  }
}
