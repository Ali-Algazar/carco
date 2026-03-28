import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/auth/data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    var result = await authRepository.login(email, password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user.role)),
    );
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await authRepository.register(
      fullName: fullName,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user.role)),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    var result = await authRepository.logout();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(UnAuthenticated()),
    );
  }

  Future<void> checkAuth() async {
    emit(AuthLoading());
    var result = await authRepository.checkAuth();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user.role)),
    );
  }
}
