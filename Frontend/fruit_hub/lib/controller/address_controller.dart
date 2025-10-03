import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';
import 'package:intl/number_symbols_data.dart';

class AddressController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  RxList addressList = [].obs;
  RxBool isError = false.obs;
  RxString currentAddressId = "".obs;
  RxString errorMessage = "".obs;

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

  void selectAddress(String id) {
    currentAddressId.value = id;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchAddressList();
  }
}
