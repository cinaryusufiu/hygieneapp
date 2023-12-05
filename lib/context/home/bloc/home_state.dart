part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

final class HomeState extends Equatable {
  final HomeStatus status;
  final HomeResponse model;

  const HomeState(
      {this.status = HomeStatus.initial, this.model = HomeResponse.empty});

  HomeState copyWith({HomeStatus? status, HomeResponse? model}) {
    return HomeState(
      status: status ?? this.status,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [status];
}
