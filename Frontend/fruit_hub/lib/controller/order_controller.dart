import 'dart:ffi';

import 'package:flutter/widgets.dart';
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
  RxBool isLoading = true.obs;

  RxBool isOrderCancelButtonActive = false.obs;

  Future<void> fetchOrder() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;
    isLoading(true);
    orderList.clear();
    try {
      final response = await _apiController.fetchOrder(token);
      if (response.isOk) {
        print("Response.OK");
        print(response.body);

        for (var order in response.body) {
          print("print order");
          print(order);
          orderList.add(OrderModel.fromJson(order));
        }
        print(orderList);
        print("print out order list length");
        print(orderList.length);
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

  Future<void> cancelOrder(OrderModel orderModel) async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;

    isLoading(true);
    errorMessage("");

    try {
      final response = await _apiController.deleteOrder(orderModel.id, token);
      if (response.isOk) {
        deleteOrderModelFromOrderList(orderModel);
        Get.back();
      } else {
        errorMessage(
            'Something went wrong! Please refresh the page and try again later');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void deleteOrderModelFromOrderList(OrderModel orderModel) {
    orderList
        .remove(orderList.firstWhere((order) => order.id == orderModel.id));
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchOrder();
  }
}
