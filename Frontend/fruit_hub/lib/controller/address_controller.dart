import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/address_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';
import 'package:intl/number_symbols_data.dart';

class AddressController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  late TextEditingController addressNameController;
  late TextEditingController addressDetailController;
  late TextEditingController phoneController;

  RxList addressList = [].obs;
  RxBool isError = false.obs;
  RxString currentAddressId = "".obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;

  Future<void> fetchAddressList() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;

    try {
      final response = await _apiController.fetchAddress(token);

      if (response.isOk) {
        addressList(response.body);

        // assign current selected address id to the value
        currentAddressId.value = addressList
            .firstWhere((address) => address['isCurrentAddress'] == true)['id'];
      } else {
        errorMessage("Something went wrong.");
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<void> createNewAddress(address) async {
    print("HI create address function ");
    String? token = await _secureStorage.readData('token');

    print(token);
    if (token == null) return;
    resetVariable();

    try {
      print("IN try block");
      final response = await _apiController.createAddress(token, address);
      print(response.body);
      if (response.isOk) {
        print("response is ok");
        addressList.add(response.body);
      } else {
        isError(true);
        errorMessage("Something went wrong");
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void selectAddress(String id) {
    currentAddressId.value = id;
  }

  void resetVariable() {
    isLoading(true);
    isError(false);
    errorMessage("");
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchAddressList();
    addressNameController = TextEditingController();
    addressDetailController = TextEditingController();
    phoneController = TextEditingController();
  }
}
