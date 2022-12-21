import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inditab_test/views/constants/auth/firebase_auth.dart';
import 'package:inditab_test/views/screens/auth/screen_auth.dart';
import 'package:inditab_test/views/screens/home/screen_home.dart';

class AuthController extends GetxController {
  static final AuthController authController = Get.find();
  late Rx<User?> firebaseUser;
  GoogleSignInAccount? gUser;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setScreen);
  }

  _setScreen(User? user) {
    if (user == null) {
      Get.offAll(
        () => ScreenAuth(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 400),
      );
    } else {
      Get.offAll(
        () => ScreenHome(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  void regisrerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  void login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  void loginWithGmail() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    await auth.signInWithCredential(credential);
  }

  signOut() {
    try {
      GoogleSignIn().signOut();
      auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
