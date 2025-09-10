import 'package:fruit_hub/model/menu_model.dart';

class OrderModel {
  final String id;
  final String status;
  final double totalPrice;
  final List<MenuModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final itemsList = json['items'] as List;
    final parsedItems = itemsList
        .map((itemJson) =>
            MenuModel.fromJson(itemJson['menu'] as Map<String, dynamic>))
        .toList();
    return OrderModel(
      id: json['id'] as String,
      status: json['status'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      items: parsedItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'total_price': totalPrice,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}
