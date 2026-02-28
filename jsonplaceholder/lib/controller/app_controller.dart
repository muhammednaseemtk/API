import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/user_model.dart';
import 'package:jsonplaceholder/service/app_service.dart';

class AppController extends ChangeNotifier {
  final AppService service = AppService();

  List<UserModel> users = [];
  bool isLoading = false;
  String? error;

  Future<void> getUsers() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try{
      users = await service.fetchUsers();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}