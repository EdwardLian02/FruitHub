import 'package:flutter/material.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:fruit_hub/widget_helper/messenger_helper.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  late TextEditingController addressNameController;
  late TextEditingController addressDetailController;
  late TextEditingController phoneController;

  RxList addressList = [].obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;

  Future<void> fetchAddressList() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;
    resetVariable();
    try {
      final response = await _apiController.fetchAddress(token);

      if (response.isOk) {
        addressList(response.body);
      } else {
        errorMessage("Something went Wrong");
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> createNewAddress(address) async {
    String? token = await _secureStorage.readData('token');

    if (token == null) return;
    resetVariable();

    try {
      final response = await _apiController.createAddress(token, address);

      if (response.isOk) {
        addressList.add(response.body);
        MessengerHelper.showSuccessToasteMessage("Created");
        Get.back();
      } else {
        isError(true);

        final errorResponse = response.body as Map<String, dynamic>;
        errorResponse.forEach((key, value) {
          errorMessage.value += "* ${value[0]}\n";
        });
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateAddress(address, addressIndex) async {
    String? token = await _secureStorage.readData('token');

    if (token == null) return;
    resetVariable();

    try {
      final response = await _apiController.updateAddress(token, address);

      if (response.isOk) {
        addressList[addressIndex] = response.body;
        MessengerHelper.showSuccessToasteMessage("Update Success");
        Get.back();
      } else {
        isError(true);

        final errorResponse = response.body as Map<String, dynamic>;
        errorResponse.forEach((key, value) {
          errorMessage.value += "* ${value[0]}\n";
        });
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteAddress(addressId, addressIndex) async {
    String? token = await _secureStorage.readData('token');

    if (token == null) return;
    resetVariable();

    try {
      final response = await _apiController.deleteAddress(token, addressId);

      if (response.isOk) {
        addressList.removeAt(addressIndex);
        MessengerHelper.showErrorToasteMessage("Address Deleted");
      } else {
        isError(true);

        final errorResponse = response.body as Map<String, dynamic>;
        errorResponse.forEach((key, value) {
          errorMessage.value += "* ${value[0]}\n";
        });
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void resetVariable() {
    isLoading(true);
    isError(false);
    errorMessage("");

    resetTextController();
  }

  void resetTextController() {
    addressDetailController.clear();
    addressNameController.clear();
    phoneController.clear();
  }

  @override
  void onInit() async {
    super.onInit();
    addressNameController = TextEditingController();
    addressDetailController = TextEditingController();
    phoneController = TextEditingController();
    await fetchAddressList();
  }
}
