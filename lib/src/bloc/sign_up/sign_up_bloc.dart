import 'package:bloc_demo/src/managers/local_db_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_up_state.dart';
import 'sign_up_event.dart';

class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>(onSignUpEvent);
  }
}

void onSignUpEvent(SignUpEvent event, Emitter<SignUpScreenState> emit) async {
  emit(SignUpLoadingState());
  LocalDBManager manager =
      LocalDBManager(await SharedPreferences.getInstance());
  bool success = await manager.saveSignUpData(event.model);
  emit(success ? SignUpSuccessState() : SignUpFailureState());
}
