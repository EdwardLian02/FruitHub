import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:get/get.dart';

class RegisterForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationController());
    return Form(
      key: _formKey,
      child: Obx(() => authController.isLoading.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          : Column(
              children: [
                CommonTextfield(
                  hintText: "example@gmail.com",
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
                  obsecureText: true,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "* This field is required!";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10),
                CommonTextfield(
                  hintText: "Confirm password",
                  controller: authController.confirmPasswordTextController,
                  obsecureText: true,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "* This fields is required!";
                    }

                    if (value != authController.passwordTextController.text) {
                      return "Confirm password need to be exact match with the password";
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
                CommonButton(
                  name: 'Be your Vegy',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await authController.signupUser(
                          authController.emailTextController.text,
                          authController.passwordTextController.text);
                    }
                  },
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                      text: "Already a Vegetarian? ",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeNormal,
                        color: MyColor.darkenGreyColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Go back',
                          style: TextStyle(
                            color: MyColor.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              authController.clearInputText();
                              authController.errorMessage("");
                              Get.offNamed('/login');
                            },
                        ),
                      ]),
                ),
              ],
            )),
    );
  }
}
