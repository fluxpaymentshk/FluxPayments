abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UserServiceLoading extends UserState {
  const UserServiceLoading();
}

class UserServiceDone extends UserState {
  const UserServiceDone();
}

class UserServiceError extends UserState {
  final String message;
  const UserServiceError(this.message);
}

class UserResetPasswordDone extends UserState {
  const UserResetPasswordDone();
}

class UserChangePasswordDone extends UserState {
  const UserChangePasswordDone();
}
