import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class CircleIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final bool haveBorder;
  final Widget icon;
  final Color buttonColor;
  final void Function()? onTap;
  const CircleIconButton(
      {super.key,
      this.width,
      this.height,
      required this.haveBorder,
      required this.icon,
      this.onTap,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width ?? 30,
        height: height ?? 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            style: haveBorder ? BorderStyle.solid : BorderStyle.none,
          ),
          color: buttonColor,
        ),
        child: icon,
      ),
    );
  }
}
