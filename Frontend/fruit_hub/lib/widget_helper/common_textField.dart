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
        fillColor: MyColor.lowGreyColor,
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}
