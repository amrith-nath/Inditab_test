import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inditab_test/views/constants/colors/colors.dart';

import 'views/screens/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inditab Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: kPurple,
          )),
      debugShowCheckedModeBanner: false,
      home: const ScreenSplash(),
    );
  }
}
