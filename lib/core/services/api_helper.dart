import 'package:carco/core/constants.dart';
import 'package:dio/dio.dart';
import '../helper/shared_preferences_service.dart';

class ApiHelper {
  Dio dio;
  final String baseUrl = 'https://carco1-production.up.railway.app/api';

  ApiHelper(this.dio);

  Future<String?> _getAuthToken() async {
    return await SharedPreferencesService.getData(key: Constants.tokeneKey);
  }

  Future<Options?> _createAuthOptions(
    bool requiresAuth, {
    bool isMultipart = false,
  }) async {
    Map<String, dynamic> headers = {};

    if (requiresAuth) {
      String? token = await _getAuthToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    if (isMultipart) {
      headers['Content-Type'] = 'multipart/form-data';
    } else {
      headers['Content-Type'] = 'application/json';
    }

    return Options(headers: headers);
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.get(
      '$baseUrl$endpoint',
      queryParameters: data,
      options: options,
    );
  }

  Future<Response> post(
    String endpoint, {
    dynamic data,
    bool requiresAuth = false,
    bool isMultipart = false,
  }) async {
    Options? options = await _createAuthOptions(
      requiresAuth,
      isMultipart: isMultipart,
    );
    return await dio.post('$baseUrl$endpoint', data: data, options: options);
  }

  Future<Response> put(
    String endpoint, {
    dynamic data,
    bool requiresAuth = false,
    bool isMultipart = false,
  }) async {
    Options? options = await _createAuthOptions(
      requiresAuth,
      isMultipart: isMultipart,
    );
    return await dio.put('$baseUrl$endpoint', data: data, options: options);
  }

  Future<Response> delete(
    String endpoint, {
    dynamic data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.delete('$baseUrl$endpoint', data: data, options: options);
  }
}
