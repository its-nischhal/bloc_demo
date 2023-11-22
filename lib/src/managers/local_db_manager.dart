import 'dart:convert';

import 'package:bloc_demo/src/model/sign_up_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDBManager {
  const LocalDBManager(this._preferences);
  final SharedPreferences _preferences;

  Future<SignUpModel?> getSignUpData(String username) async {
    final String? user = _preferences.getString(username);
    if (user != null) {
      return signUpModelFromJson(jsonDecode(user));
    }
    return null;
  }

  Future<bool> saveSignUpData(SignUpModel signUpModel) async {
    if (_preferences.getKeys().contains(signUpModel.username)) return false;
    await _preferences.setString(
        signUpModel.username, jsonEncode(signUpModel.toJson()));
    return true;
  }
}
