import 'package:bloc_demo/src/model/home_screen_model.dart';

abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenSuccessState extends HomeScreenState {
  HomeScreenSuccessState(this.model);
  final HomeModel model;
}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenFailureState extends HomeScreenState {}
