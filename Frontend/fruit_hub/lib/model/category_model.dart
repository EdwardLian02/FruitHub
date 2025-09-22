import 'package:get/get.dart';

class CategoryModel {
  String id;
  String name;
  RxBool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    bool isSelected = false,
  }) : isSelected = isSelected.obs;

  factory CategoryModel.fromJson(Map<String, dynamic> data) => CategoryModel(
        id: data['id'],
        name: data['name'],
      );
}
