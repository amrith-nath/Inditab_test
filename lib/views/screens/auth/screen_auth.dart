import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inditab_test/controllers/auth_controller.dart';
import 'package:inditab_test/views/constants/font/fonts.dart';
import 'package:inditab_test/views/constants/size/size.dart';
import 'package:inditab_test/views/screens/auth/register.dart';
import 'package:lottie/lottie.dart';

class ScreenAuth extends StatelessWidget {
  ScreenAuth({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Log In',
                  style: KFonts.splashTextStyle,
                ),
                Lottie.asset(
                  'asset/lotties/53395-login.json',
                  fit: BoxFit.fill,
                  height: size.height / 2.7,
                ),
                inpiutWidget(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cant let the field empty';
                      } else if (!value.contains('@') ||
                          !value.contains('.') ||
                          value.contains(' ')) {
                        return 'Invalid email';
                      }
                      return null;
                    }),
                kHeight,
                inpiutWidget(
                    icon: Icons.password_outlined,
                    label: 'Password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cant let the field empty';
                      } else if (value.length < 6) {
                        return 'password must be more than 6 characters';
                      } else if (value.contains(' ')) {
                        return 'Invalid password format';
                      }
                      return null;
                    }),
                kHeight20,
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthController.authController.login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: KFonts.buttonTextStyle,
                    ),
                  ),
                ),
                Text(
                  'OR',
                  style: KFonts.bodySmallTextStyle,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      AuthController.authController.loginWithGmail();
                    },
                    child: Text(
                      'Login with Google',
                      style: KFonts.buttonTextGstyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?   ",
                      style: KFonts.bodySmallTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => ScreenRegister(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      child: const Text('Register'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox inpiutWidget({
    required String label,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required IconData icon,
  }) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.deepPurple),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.deepPurple),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.deepPurple),
            ),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.deepPurple,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: KFonts.inputLabelStyle,
                ),
              ],
            )),
      ),
    );
  }
}
