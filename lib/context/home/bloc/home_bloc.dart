import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/home_response_model.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeGetItemsRequestedEvent>(_onHomeLoadedEvent);
  }

  Future<void> _onHomeLoadedEvent(
    HomeGetItemsRequestedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
        status: HomeStatus.success,
        model: const HomeResponse(title: "title", content: "content")));
  }
}
