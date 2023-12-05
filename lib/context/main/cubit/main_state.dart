part of 'main_cubit.dart';

enum MainTab { home, task, profile }

final class MainState extends Equatable {
  const MainState({this.tab = MainTab.home});

  final MainTab tab;

  @override
  List<Object?> get props => [tab];
}
