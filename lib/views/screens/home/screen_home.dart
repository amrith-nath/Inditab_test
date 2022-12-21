import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inditab_test/controllers/user_controller.dart';

import '../../../controllers/auth_controller.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              AuthController.authController.signOut();
            },
            label: const Text('Sigout'),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
