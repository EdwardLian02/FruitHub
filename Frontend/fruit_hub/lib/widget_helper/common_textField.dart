import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class CommonTextfield extends StatelessWidget {
  final String hintText;
  const CommonTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColor.textFieldFillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      ),
    );
  }
}
