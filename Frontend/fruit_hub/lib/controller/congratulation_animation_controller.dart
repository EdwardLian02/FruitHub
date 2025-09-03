import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CongratulationAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Tween with overshoot curve for bounce effect
    scale = Tween<double>(begin: 1.2, end: 1.2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticInOut, // ✅ bounce effect
      ),
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
