import 'package:bloc_demo/src/bloc/home/home_state.dart';
import 'package:bloc_demo/src/bloc/sign_in/sign_in_state.dart';
import 'package:bloc_demo/src/bloc/sign_up/sign_up_state.dart';
import 'package:bloc_demo/src/managers/local_db_manager.dart';
import 'package:bloc_demo/src/model/sign_up_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_in_event.dart';

class SignInScreenBloc extends Bloc<SignInScreenEvent, SignInScreenState> {
  SignInScreenBloc() : super(SignInInitialState()) {
    on<SignInEvent>(onSignInEvent);
  }
}

void onSignInEvent(SignInEvent event, Emitter<SignInScreenState> emit) async {
  emit(SignInLoadingState());
  LocalDBManager manager =
      LocalDBManager(await SharedPreferences.getInstance());
  SignUpModel? user = await manager.getSignUpData(event.username);
  if (user != null && user.password == event.password) {
    emit(SignInSuccessState());
  } else {
    emit(SignInFailureState());
  }
}
