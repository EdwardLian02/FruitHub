import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class CommonTextfield extends StatelessWidget {
  final String hintText;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  final TextEditingController? controller;
  CommonTextfield(
      {super.key,
      required this.hintText,
      this.validator,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColor.textFieldFillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: TextStyle(color: Colors.red),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      ),
    );
  }
}
