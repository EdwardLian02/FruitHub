import 'package:fruit_hub/model/menu_model.dart';

class BasketItem {
  final MenuModel menu;
  int qty;

  BasketItem({
    required this.menu,
    required this.qty,
  });

/*
  {
    'menu': menuModel,
    'qty' : qty
  }
*/

  factory BasketItem.fromMap(Map<String, dynamic> map) {
    return BasketItem(
      menu: map['menu'],
      qty: map['qty'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'menu': menu.toJson(),
      'qty': qty,
    };
  }
}
