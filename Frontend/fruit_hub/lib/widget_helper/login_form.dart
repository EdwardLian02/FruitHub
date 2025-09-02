import 'package:flutter/material.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:get/get.dart';

class Loginform extends StatelessWidget {
  final Key formKey;
  const Loginform({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            CommonTextfield(hintText: "Tony"),
            SizedBox(height: 10),
            CommonTextfield(
              hintText: "**********",
            ),
            SizedBox(height: 60),
            CommonButton(
              name: 'Start Ordering',
              onTap: () {
                Get.offNamed('/home');
              },
            ),
          ],
        ));
  }
}
