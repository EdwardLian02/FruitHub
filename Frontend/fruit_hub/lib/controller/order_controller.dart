import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/controller/basket_controller.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _basketController = Get.find<BasketController>();

  final _secureStorage = SecureStorageService();

  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;

  Future<void> createOrder() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;
    isLoading(true);
    errorMessage("");
    try {
      final response =
          await _apiController.createOrder(_basketController.basket, token);
      if (response.isOk) {
        _basketController.clearBasket();
        Get.back();
        Get.toNamed('/order-success');
      } else {
        errorMessage("Something went wrongs. Please try again later");
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
