import 'dart:ffi';

import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/controller/basket_controller.dart';
import 'package:fruit_hub/model/order_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _basketController = Get.find<BasketController>();
  final _secureStorage = SecureStorageService();

  RxList<OrderModel> orderList = <OrderModel>[].obs;

  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;

  Future<void> fetchOrder() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;
    isLoading(true);
    orderList.clear();
    try {
      final response = await _apiController.fetchOrder(token);
      if (response.isOk) {
        print(response.body);

        for (var order in response.body) {
          orderList.add(OrderModel.fromJson(order));
        }

        print(orderList);
      } else {
        errorMessage("Something went wrong!");
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

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
        await fetchOrder();
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

  @override
  void onInit() async {
    super.onInit();

    await fetchOrder();
  }
}
