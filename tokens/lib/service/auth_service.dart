import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tokens/constant/api_constants.dart';

class AuthService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  Future<(String?, String?)> login({
    required String email,
    required String password,
  }) async {
    try {
      log('Logging...');

      final response = await dio.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        log('Login responae:${response.data}');
        final String? token = response.data['access_token'];
        return (token, null);
      } else {
        return (null, 'Invalid response');
      }
    } on DioException catch (e) {
      log('Login error:${e.response?.data}');

      return (null, e.message ?? 'Login failed');
    } catch (e) {
      return (null, 'Somthing went wrong');
    }
  }

  Future<(Map<String, dynamic>?, String?)> fetchProfile(String token) async {
    try {
      log('fetching profile');

      final response = await dio.get(ApiConstants.profile);

      if (response.statusCode == 200) {
        final Map<String, dynamic> profile = Map<String, dynamic>.from(
          response.data
        );

        return (profile, null);
      }else {
        return (null,'UnAuthorized');
      }
    }on DioException catch (e) {
      log('Profile error:${e.response?.data}');

      return(null, 'Session expired');
    }catch (e) {
      return (null,'Something went wrong');
    }
  }
}
