import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class CommonButton extends StatelessWidget {
  final String name;
  final void Function()? onTap;

  const CommonButton({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: MyColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: FontTheme.textSizeNormal,
                color: MyColor.whiteTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
