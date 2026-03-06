import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().fetch();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),

      body: Consumer<UserController>(
        builder: (context, controller, child) {

          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.error != null) {
            return Center(
              child: Text(controller.error!),
            );
          }

          if (controller.users.isEmpty) {
            return const Center(
              child: Text("No users found"),
            );
          }

          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {

              final user = controller.users[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    user.name?.substring(0,1) ?? '',
                  ),
                ),
                title: Text(user.name ?? ''),
                subtitle: Text(user.email ?? ''),
                trailing: Text(user.phone ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}