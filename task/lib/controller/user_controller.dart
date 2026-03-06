import 'package:flutter/foundation.dart';
import 'package:task/model/user_model.dart';
import 'package:task/service/user_service.dart';

class UserController extends ChangeNotifier {
  final UserService service = UserService();

  List<UserModel> users = [];
  bool isLoading = false;
  String? error;

  Future<void> fetch() async {

    isLoading = true;
    error = null;
    notifyListeners();

    try {

      users = await service.fetchData();

    } catch (e) {

      error = e.toString();

    } finally {

      isLoading = false;
      notifyListeners();

    }
  }
}