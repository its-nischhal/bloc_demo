import 'package:bloc_demo/src/data/home_data.dart';
import 'package:bloc_demo/src/model/home_screen_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';
import 'home_event.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<FetchHomeScreenDataEvent>(fetchHomeScreenData);
  }
}

void fetchHomeScreenData(
    FetchHomeScreenDataEvent event, Emitter<HomeScreenState> emit) {
  emit(HomeScreenLoadingState());
  emit(HomeScreenSuccessState(HomeModel.fromJson(productData)));
}
