abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class UserSignedInAuthState extends AuthState {
  const UserSignedInAuthState();
}

class UserSignedUpAuthState extends AuthState {
  const UserSignedUpAuthState();
}

class ConfirmUserState extends AuthState {
  const ConfirmUserState();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}
