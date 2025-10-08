import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: CircularProgressIndicator(
          color: MyColor.primaryColor,
        ),
      ),
    );
  }
}
