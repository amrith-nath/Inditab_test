import 'package:flutter/material.dart';
import 'package:inditab_test/controllers/auth_controller.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AuthController.authController.loginWithGmail();
            },
            child: Text('Signin with google')),
      ),
    );
  }
}
