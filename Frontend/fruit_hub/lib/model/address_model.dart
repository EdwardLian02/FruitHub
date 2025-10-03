import 'package:fruit_hub/model/menu_model.dart';
import 'package:get/get.dart';

class AddressModel {
  String id;
  String name;
  String address;
  String phone;
  RxBool isCurrentAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required bool isCurrentAddress,
  }) : isCurrentAddress = isCurrentAddress.obs;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'] ?? "no phone",
        isCurrentAddress: json['isCurrentAddress'],
      );

  Map<String, dynamic> toJson(AddressModel model) => {
        "name": model.name,
        "address": model.address,
        "phone": model.phone,
        "isCurrentAddress": model.isCurrentAddress,
      };
}
