import 'package:carco/core/network/api_constants.dart';
import 'package:carco/core/services/api_helper.dart';
import 'package:carco/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({
    required String fullName,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiHelper apiHelper;

  AuthRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiHelper.post(
      ApiConstants.login,
      data: {"email": email, "password": password},
      requiresAuth: false,
    );

    return UserModel.fromJson(response.data);
  }

  @override
  Future<UserModel> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await apiHelper.post(
      ApiConstants.register,
      data: {"fullName": fullName, "email": email, "password": password},
      requiresAuth: false,
    );

    return UserModel.fromJson(response.data);
  }
}
