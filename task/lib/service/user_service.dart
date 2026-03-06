import 'package:dio/dio.dart';
import 'package:task/model/user_model.dart';

class UserService {
  final Dio dio = Dio();

  Future<List<UserModel>> fetchData() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      if (response.statusCode == 200 && response.data != null) {
        final List data = response.data;

        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed loading');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
