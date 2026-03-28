abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String role;
  Authenticated(this.role);
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
