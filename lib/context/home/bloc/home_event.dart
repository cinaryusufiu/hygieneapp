part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeGetItemsRequestedEvent extends HomeEvent {
  const HomeGetItemsRequestedEvent();
}

final class HomeShowAllCategoryEvent extends HomeEvent {
  const HomeShowAllCategoryEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

final class HomeSearchStartedEvent extends HomeEvent {
  const HomeSearchStartedEvent();
}
