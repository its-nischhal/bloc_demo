class SignUpModel {
  const SignUpModel(this.username, this.password, this.name);
  final String name;
  final String username;
  final String password;

  Map<String, dynamic> toJson() =>
      {'name': name, 'username': username, 'password': password};
}

SignUpModel signUpModelFromJson(Map<String, dynamic> json) =>
    SignUpModel(json['username'], json['password'], json['name']);
