import 'package:get/get.dart';

class CategoryModel {
  String name;
  RxBool isSelected;

  CategoryModel({
    required this.name,
    bool isSelected = false,
  }) : isSelected = isSelected.obs;

  factory CategoryModel.fromJson(Map<String, dynamic> data) =>
      CategoryModel(name: data['name']);
}
