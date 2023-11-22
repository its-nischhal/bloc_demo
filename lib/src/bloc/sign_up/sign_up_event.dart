import 'package:bloc_demo/src/model/sign_up_model.dart';

abstract class SignUpScreenEvent {
  const SignUpScreenEvent();
}

class SignUpEvent extends SignUpScreenEvent {
  const SignUpEvent(this.model);
  final SignUpModel model;
}
