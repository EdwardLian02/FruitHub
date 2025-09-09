import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_hub/model/basket_model.dart';
import 'package:get/get.dart';

class BasketController extends GetxController {
  RxInt menuBasketCount = 1.obs; //Main counter
  RxInt originalMenuQty = 1
      .obs; //To track if the user has changed the menu count that is already in the basket

  RxList<BasketItem> basket = <BasketItem>[].obs;
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

  setAlreadyInBasketMenuQtyInDetailScreen(String menuId) {
    BasketItem basketItem = basket.firstWhere((e) => e.menu.id == menuId);
    menuBasketCount.value = basketItem.qty;

    //Also set the current basket count
    //to track changes later on
    originalMenuQty.value = menuBasketCount.value;
  }

  bool checkIfTheCurrentQtyIsChanged() {
    return menuBasketCount.value != originalMenuQty.value;
  }

  void updateBasketQty(String menuId) {
    BasketItem basketItem = basket.firstWhere((e) => e.menu.id == menuId);
    basketItem.qty = menuBasketCount.value;

    originalMenuQty.value = menuBasketCount.value;
    calculateTotalPrice(basket);
  }

  void addToBasket(Map<String, dynamic> basketItem) {
    basketItem['menu'].isInBasket.value = true;

    basket.add(BasketItem.fromMap(basketItem)); //including qty
    originalMenuQty.value = menuBasketCount.value;
    calculateTotalPrice(basket);
  }

  void deleteFromBasket(int index) {
    basket.removeAt(index);
    calculateTotalPrice(basket);
  }

  void calculateTotalPrice(List basket) {
    totalPrice(0.0);
    for (BasketItem basketItem in basket) {
      totalPrice.value += basketItem.menu.price * basketItem.qty;
    }
  }

  void clearBasket() {
    print('clear basket');
    for (var basketItem in basket) {
      basketItem.menu.isInBasket.value = false;
    }

    basket.clear();
    totalPrice.value = 0.0;
    clearCounter();
  }
}
