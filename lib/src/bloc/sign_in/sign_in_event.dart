abstract class SignInScreenEvent {
  const SignInScreenEvent();
}

class SignInEvent extends SignInScreenEvent {
  const SignInEvent(this.password, this.username);
  final String password;
  final String username;
}
