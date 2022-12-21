import 'dart:developer';

import 'package:get/get.dart';
import 'package:inditab_test/models/user_model.dart';
import 'package:inditab_test/services/database_services.dart';
import 'package:inditab_test/views/constants/auth/firebase_auth.dart';

class UserController extends GetxController {
  UserModel? user;
  final _dataBaseServices = DataBaseServices();

  @override
  void onReady() async {
    log(auth.currentUser!.email!);
    user = await _dataBaseServices.getUser(email: auth.currentUser!.email!);
    super.onReady();
  }
}
