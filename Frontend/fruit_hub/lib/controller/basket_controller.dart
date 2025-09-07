import 'package:get/get.dart';

class BasketController extends GetxController {
  RxInt menuBasketCount = 1.obs;

  increaseCounter() => menuBasketCount.value++;

  decreaseCounter() =>
      menuBasketCount.value > 1 ? menuBasketCount.value-- : null;

  clearCounter() => menuBasketCount.value = 1;
}
