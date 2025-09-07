import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:get/get.dart';

class Loginform extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthenticationController authController;
  Loginform({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CommonTextfield(
              hintText: "tony12@gmail.com",
              controller: authController.emailTextController,
              validator: (value) {
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
                );

                if (value == null || value == "") {
                  return "* This fields is required!";
                }

                if (!emailRegex.hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            CommonTextfield(
              hintText: "**********",
              controller: authController.passwordTextController,
              validator: (value) {
                if (value == null || value == "") {
                  return "* This field is required!";
                }

                return null;
              },
            ),
            SizedBox(height: 10),
            Obx(() {
              if (authController.errorMessage.isEmpty) {
                return const SizedBox.shrink(); // nothing if no error
              }
              return Text(
                authController.errorMessage.value,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              );
            }),
            SizedBox(height: 50),
            CommonButton(
              name: 'Start Ordering',
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await authController.loginUser(
                      authController.emailTextController.text,
                      authController.passwordTextController.text);
                }
              },
            ),
          ],
        ));
  }
}
