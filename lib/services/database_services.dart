import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:inditab_test/controllers/utils/utils.dart';
import 'package:inditab_test/models/user_model.dart';

class DataBaseServices {
  final FirebaseFirestore dbService = FirebaseFirestore.instance;
  Future<void> createUser(
      {required String email, required UserModel user}) async {
    try {
      await dbService.collection('users').doc(email).set(user.toMap());
    } catch (e) {
      Get.showSnackbar(snackBarsignInError);
    }
  }

  updateUser(
      {required UserModel user,
      required String field,
      required String value}) async {
    try {
      await dbService
          .collection('users')
          .doc(user.email)
          .update({field: value});
    } catch (e) {
      Get.showSnackbar(snackBarUserError);
    }
  }

  createUserGoogle({required String email, required UserModel user}) async {
    try {
      var temp = await dbService.collection('users').get();

      if (!temp.docs.any((element) => element['id'] == email)) {
        log('User not Exist');
        await dbService.collection('users').doc(email).set(user.toMap());
      } else {
        log('User Exist');
      }
    } catch (e) {
      Get.showSnackbar(snackBarUserError);
      return null;
    }
  }

  Future<UserModel?> getUser({required String email}) async {
    try {
      final userDoc = await dbService.collection('users').doc(email).get();
      final user = UserModel.fromMap(userDoc);
      return user;
    } catch (e) {
      Get.showSnackbar(snackBarUserError);
      return null;
    }
  }

  createBooking() {}
  getBookings() {}
}
