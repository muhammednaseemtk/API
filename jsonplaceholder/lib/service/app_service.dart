import 'package:dio/dio.dart';
import 'package:jsonplaceholder/model/user_model.dart';

class AppService {
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        return status != null && status < 500;
      },
    ),
  );

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      if (response.statusCode == 200) {
        final List users = response.data;
        return users.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}