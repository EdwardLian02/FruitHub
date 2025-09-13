import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/model/order_item_model.dart';

class OrderModel {
  final String id;
  final String status;
  final double totalPrice;
  final List<OrderItemModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.items,
  });
//  {
//         "id": "b73779c3-9afa-4a5e-8e96-632fe71d6f73",
//         "user": 2,
//         "status": "P",
//         "total_price": 122000.0,
//         "orders": [
//             {
//                 "menu": {},
//                 "qty": 3
//             },
//             {
//                 "menu": {},
//                 "qty": 1
//             }
//         ]
//     },
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final itemList = json['orders'] as List;

    final parseItemList = itemList.map((item) {
      return OrderItemModel.fromJson(item as Map<String, dynamic>);
    }).toList();

    return OrderModel(
      id: json['id'] as String,
      status: json['status'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      items: parseItemList,
    );
  }
}
