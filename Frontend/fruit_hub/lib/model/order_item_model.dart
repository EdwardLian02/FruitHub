import 'package:fruit_hub/model/menu_model.dart';

class OrderItemModel {
  final MenuModel menu;
  final int qty;

  OrderItemModel({required this.menu, required this.qty});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        menu: MenuModel.fromJson(json['menu'] as Map<String, dynamic>),
        qty: json['qty'],
      );
}
