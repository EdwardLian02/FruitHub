import 'package:get/get.dart';

class SplashLogoController extends GetxController {
  var opacity = 0.0.obs;
  var scale = 0.8.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 100), () {
      opacity.value = 1.0;
      scale.value = 1;
    });

    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed('/splash2');
    });
  }
}
