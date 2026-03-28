import 'package:carco/core/errors/failures.dart';
import 'package:carco/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:carco/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:carco/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  String _getErrorMessage(dynamic e) {
    if (e is DioException && e.response != null) {
      return e.response?.data['message'] ?? 'حدث خطأ في السيرفر';
    }
    return e.toString();
  }

  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      var user = await remoteDataSource.login(email: email, password: password);

      await localDataSource.cacheUserToken(user.token);
      await localDataSource.cacheUser(user);

      return Right(user);
    } catch (e) {
      return Left(ServerFailure(_getErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await localDataSource.clearCachedUser();
      await localDataSource.clearCachedUserToken();
      await Hive.deleteFromDisk();

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(_getErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      var user = await remoteDataSource.register(
        fullName: fullName,
        email: email,
        password: password,
      );

      await localDataSource.cacheUserToken(user.token);
      await localDataSource.cacheUser(user);

      return Right(user);
    } catch (e) {
      return Left(ServerFailure(_getErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, UserModel>> checkAuth() async {
    try {
      final token = await localDataSource.getCachedUserToken();
      if (token == null) {
        return Left(ServerFailure('No cached token found'));
      }
      final user = await localDataSource.getCachedUser();
      if (user == null) {
        return Left(ServerFailure('No cached user found'));
      }
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
