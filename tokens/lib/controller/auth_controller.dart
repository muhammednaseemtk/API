import 'package:flutter/material.dart';
import 'package:tokens/service/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService service = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoginLoading = false;
  bool isProfileLoading = false;

  String error = '';
  String? token;
  Map<String, dynamic>? profile;

  bool _isProfileLoaded = false;

  Future<void> loginUser() async {
    isLoginLoading = true;
    error = '';
    notifyListeners();

    final (data, err) = await service.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (data != null) {
      token = data;
      _resetProfileState();
    } else {
      error = err ?? 'Login failed';
    }

    isLoginLoading = false;
    notifyListeners();
  }

  Future<void> loadProfile() async {
    if (token == null || _isProfileLoaded || isProfileLoading) return;

    isProfileLoading = true;
    error = '';
    notifyListeners();

    final (data, err) = await service.fetchProfile(token!);

    if (data != null) {
      profile = data;
      _isProfileLoaded = true;
    } else {
      error = err ?? 'Failed to load Profile';
    }

    isProfileLoading = false;
    notifyListeners();
  }

  void logout() {
    token = null;
    _resetProfileState();
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  void _resetProfileState() {
    profile = null;
    _isProfileLoaded = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }
}
