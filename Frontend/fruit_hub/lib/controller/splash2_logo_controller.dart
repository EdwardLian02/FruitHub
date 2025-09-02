import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash2LogoController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5), // Start from top
      end: Offset.zero, // Drop to center
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut, // Bounce effect
    ));

    animationController.forward();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    animationController.dispose();
    super.dispose();
    super.onClose();
  }
}
