import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inditab_test/views/constants/auth/firebase_auth.dart';
import 'package:inditab_test/views/constants/colors/colors.dart';
import 'package:inditab_test/views/constants/font/fonts.dart';

import 'views/screens/splash/screen_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase.then((value) {
    log('Firebase Enabled');
  });
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
        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: KFonts.appbartextStyle, centerTitle: true),
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenSplash(),
    );
  }
}
