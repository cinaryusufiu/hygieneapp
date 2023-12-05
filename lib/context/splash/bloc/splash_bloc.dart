import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashStartAppEvent>(_onStartupApp);
  }

  Future<void> _onStartupApp(
    SplashStartAppEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(status: SplashStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 6));
      emit(state.copyWith(status: SplashStatus.success));
    } catch (_) {
      emit(state.copyWith(status: SplashStatus.failure));
    }
  }
}
