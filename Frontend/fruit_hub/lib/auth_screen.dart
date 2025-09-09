import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/home_screen.dart';
import 'package:fruit_hub/splash_screen2.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();
    return Scaffold(
      body: Obx(
        () {
          print("check isLogin status");
          if (authController.isLogin.value) {
            return HomeScreen();
          } else {
            return SplashScreen2();
          }
        },
      ),
    );
  }
}
