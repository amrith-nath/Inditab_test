import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              AuthController.authController.signOut();
            },
            label: Text('Sigout'),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
