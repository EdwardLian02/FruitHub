import 'package:flutter/material.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/login_form.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationController());
    return Scaffold(
      body: Column(
        children: [
          //Visual section
          Flexible(
            flex: 1,
            child: Container(
              color: MyColor.primaryColor,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Image.asset('assets/images/splash3.png'),
                  ),
                ],
              ),
            ),
          ),

          //Info section
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Loginform(
                    authController: authController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
