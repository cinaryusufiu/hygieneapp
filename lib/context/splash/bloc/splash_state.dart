part of 'splash_bloc.dart';

enum SplashStatus { initial, loading, success, failure }

final class SplashState extends Equatable {
  final SplashStatus status;

  const SplashState({this.status = SplashStatus.initial});

  SplashState copyWith({SplashStatus? status}) {
    return SplashState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
