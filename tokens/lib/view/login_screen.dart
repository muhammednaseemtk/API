import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokens/controller/auth_controller.dart';
import 'package:tokens/view/profile_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(title:  Text('Login')),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailController,
                decoration:  InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
          
               SizedBox(height: 20),
          
              TextField(
                controller: controller.passwordController,
                decoration:  InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
          
               SizedBox(height: 50),
          
              if (controller.error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    controller.error,
                    style:  TextStyle(color: Colors.red),
                  ),
                ),
          
              controller.isLoginLoading
                  ?  Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        await controller.loginUser();
          
                        if (controller.token != null && context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  ProfileScreen(),
                            ),
                          );
                        }
                      },
          
                      child:  Text('Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
