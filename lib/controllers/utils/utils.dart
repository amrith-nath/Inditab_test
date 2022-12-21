import 'package:flutter/material.dart';
import 'package:get/get.dart';

const snackBarGoogleError = GetSnackBar(
  title: 'Error',
  message: 'Google signIn error',
  backgroundColor: Colors.red,
  duration: Duration(seconds: 2),
  margin: EdgeInsets.all(10),
  borderRadius: 5,
  animationDuration: Duration(milliseconds: 400),
);

const snackBarSignOutError = GetSnackBar(
  title: 'Error',
  message: 'SignOut Error',
  backgroundColor: Colors.red,
  duration: Duration(seconds: 2),
  margin: EdgeInsets.all(10),
  borderRadius: 5,
  animationDuration: Duration(milliseconds: 400),
);

const snackBarsignInError = GetSnackBar(
  title: 'Error',
  message: 'User SignIn Error',
  backgroundColor: Colors.red,
  duration: Duration(seconds: 2),
  margin: EdgeInsets.all(10),
  borderRadius: 5,
  animationDuration: Duration(milliseconds: 400),
);

const snackBarRegisterError = GetSnackBar(
  title: 'Error',
  message: 'User Register Error',
  backgroundColor: Colors.red,
  duration: Duration(seconds: 2),
  margin: EdgeInsets.all(10),
  borderRadius: 5,
  animationDuration: Duration(milliseconds: 400),
);
