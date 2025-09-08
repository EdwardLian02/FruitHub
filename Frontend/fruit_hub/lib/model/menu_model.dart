import 'package:get/get.dart';

class MenuModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  RxBool isInBasket;

  MenuModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    bool isInBasket = false,
  }) : isInBasket = isInBasket.obs;

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price.toString(),
      'imageUrl': imageUrl,
      'category': category,
    };
  }
}
