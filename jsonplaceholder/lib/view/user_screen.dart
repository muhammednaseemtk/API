import 'package:flutter/material.dart';
import 'package:jsonplaceholder/controller/app_controller.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppController>().getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'), centerTitle: true),

      body: Consumer<AppController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name ?? ''),
                      Text(user.username ?? ''),
                      Text(user.email ?? ''),
                      Text(user.phone ?? ''),
                      Text(user.website ?? ''),
                      Text(user.address?.city ?? ''),
                      Text(user.address?.street ?? ''),
                      Text(user.address?.suite ?? ''),
                      Text(user.address?.zipcode ?? ''),
                      Text(user.company?.name1 ?? ''),
                      Text(user.company?.catchPhrase ?? ''),
                      Text(user.company?.bs ?? ''),
                      Text(user.address?.geo?.lat ?? ''),
                      Text(user.address?.geo?.lng ?? ''),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
