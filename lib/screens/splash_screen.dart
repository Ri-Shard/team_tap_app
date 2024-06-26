import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/screens/auth/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return GetBuilder(
        id: 'splashView',
        init: authController,
        builder: (context) {
          return Scaffold(
            backgroundColor: MyTheme.splashback,
            body: Center(child: Image.asset('assets/images/logoSplash.png')),
          );
        });
  }
}
