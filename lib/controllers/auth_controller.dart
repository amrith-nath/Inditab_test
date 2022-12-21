import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inditab_test/controllers/utils/utils.dart';
import 'package:inditab_test/models/user_model.dart';
import 'package:inditab_test/services/database_services.dart';
import 'package:inditab_test/services/location_services.dart';
import 'package:inditab_test/views/constants/auth/firebase_auth.dart';
import 'package:inditab_test/views/screens/auth/screen_auth.dart';
import 'package:inditab_test/views/screens/home/screen_home.dart';

class AuthController extends GetxController {
  static final AuthController authController = Get.find();
  late Rx<User?> firebaseUser;
  final _dataBaseServices = DataBaseServices();
  final _locationServices = LocationServices();
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
        transition: Transition.leftToRight,
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

  Future<dynamic> show() {
    return Future.delayed(const Duration(seconds: 5));
  }

  void registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Get.showOverlay(
      asyncFunction: show,
      loadingWidget: const Center(
        child: CircularProgressIndicator(),
      ),
    );
    var location = await _locationServices.determinePosition();

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _dataBaseServices.createUser(
        email: email,
        user: UserModel(
          id: email,
          email: email,
          bookingIds: [],
          longitude: location.longitude.toString(),
          latitude: location.latitude.toString(),
        ),
      );
    } catch (e) {
      Get.showSnackbar(snackBarRegisterError);
    }
  }

  void login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.showSnackbar(snackBarsignInError);
    }
  }

  void loginWithGmail() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      log('Step 1');
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      log('Step 2');

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      log('Step 3');

      await auth.signInWithCredential(credential);
      Get.showOverlay(
        asyncFunction: show,
        loadingWidget: const Center(
          child: CircularProgressIndicator(),
        ),
      );
      var location = await _locationServices.determinePosition();
      await _dataBaseServices.createUserGoogle(
        email: googleUser!.email,
        user: UserModel(
          id: googleUser.email,
          email: googleUser.email,
          bookingIds: [],
          longitude: location.longitude.toString(),
          latitude: location.latitude.toString(),
        ),
      );

      log('Step 4');
    } catch (e) {
      Get.showSnackbar(snackBarGoogleError);
    }
  }

  signOut() {
    try {
      GoogleSignIn().signOut();
      auth.signOut();
    } catch (e) {
      Get.showSnackbar(snackBarSignOutError);
    }
  }
}
