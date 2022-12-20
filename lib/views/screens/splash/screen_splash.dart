import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inditab_test/views/constants/font/fonts.dart';
import '../../constants/size/size.dart';
import '../auth/screen_auth.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => startNavigate());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('inditab', style: KFonts.splashTextStyle),
            kHeight,
            const SizedBox(
              height: 20,
              width: 20,
              child: Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }

  startNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => ScreenAuth(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 400));
  }
}
