import 'package:bloc_demo/src/model/sign_up_model.dart';

class SignUpDBModel {
  const SignUpDBModel(this.usersData);
  final List<SignUpModel> usersData;

  Map<String, dynamic> toJson() =>
      {'data': usersData.map((e) => e.toJson()).toList()};
}
