class LoginListener {
  Function loginSuccess;
  Function loginFailure;
  Function logoutSuccess;
  Function logoutFailure;
  LoginListener({
    required this.loginSuccess,
    required this.loginFailure,
    required this.logoutSuccess,
    required this.logoutFailure,
  });
}
