import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/splash_logo_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashLogoController());
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: splashController.opacity.value,
              child: AnimatedScale(
                scale: splashController.scale.value,
                duration: Duration(seconds: 2),
                child: SizedBox(
                  width: 400,
                  child: Center(
                    child: Image.asset('assets/images/splash.png'),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
