import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  RxInt menuBasketCount = 1.obs;

  RxBool isChanging = false.obs;
  RxList<Map<String, dynamic>> basket = <Map<String, dynamic>>[].obs;
  RxDouble totalPrice = 0.0.obs;
  /*
    basket = {
        "menu": MenuModel, 
        "qty": 2,
      }
  */

  increaseCounter() => menuBasketCount.value++;

  decreaseCounter() =>
      menuBasketCount.value > 1 ? menuBasketCount.value-- : null;

  clearCounter() => menuBasketCount.value = 1;

  void addToBasket(Map<String, dynamic> basketItem) {
    basketItem['menu'].isInBasket.value = true;
    basket.add(basketItem);
    calculateTotalPrice(basket);
  }

  void deleteFromBasket(int index) {
    basket.removeAt(index);
    calculateTotalPrice(basket);
  }

  void calculateTotalPrice(List<Map<String, dynamic>> basket) {
    totalPrice(0.0);
    for (Map<String, dynamic> basketItem in basket) {
      totalPrice.value += basketItem['menu'].price * basketItem['qty'];
    }
  }

  void clearBasket() {
    print('clear basket');
    for (var basketItem in basket) {
      print('hi');
      basketItem['menu'].isInBasket.value = false;
    }

    basket.clear();
    totalPrice.value = 0.0;
    clearCounter();
  }
}
