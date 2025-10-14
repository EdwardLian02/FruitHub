import 'package:flutter/material.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

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
    resetVariable();
    try {
      final response = await _apiController.fetchAddress(token);

      if (response.isOk) {
        addressList(response.body);

        // assign current selected address id to the value
        currentAddressId.value = addressList
            .firstWhere((address) => address['isCurrentAddress'] == true)['id'];
      } else {
        errorMessage("Something went Wrong");
      }
    } catch (e) {
      errorMessage(e.toString());
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
        Get.back();
      } else {
        isError(true);

        final errorResponse = response.body as Map<String, dynamic>;
        errorResponse.forEach((key, value) {
          print("$key $value");
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

  void selectAddress(String id) {
    currentAddressId.value = id;
  }

  void resetVariable() {
    isLoading(true);
    isError(false);
    errorMessage("");

    addressDetailController.clear();
    addressNameController.clear();
    phoneController.clear();
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
