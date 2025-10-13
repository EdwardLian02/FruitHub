import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';

class AddressModel {
  String? id;
  String name;
  String address;
  String phone;
  RxBool isCurrentAddress;

  AddressModel({
    this.id,
    required this.name,
    required this.address,
    required this.phone,
    required bool isCurrentAddress,
  }) : isCurrentAddress = isCurrentAddress.obs;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'] as String?,
        name: json['name'] as String,
        address: json['address'] as String,
        phone: json['phone'] ?? "no phone",
        isCurrentAddress: json['isCurrentAddress'] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "isCurrentAddress": isCurrentAddress,
      };
}
