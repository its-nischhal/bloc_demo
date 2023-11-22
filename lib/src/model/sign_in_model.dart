class SignInModel {
  const SignInModel(this.username, this.password);
  final String username;
  final String password;

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}

SignInModel signInModelFromJson(Map<String, dynamic> json) =>
    SignInModel(json['username'], json['password']);
