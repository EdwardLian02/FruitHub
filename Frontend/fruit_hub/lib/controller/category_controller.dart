import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/category_model.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  //For storing currently filtering cateogory
  RxList<CategoryModel> filterCategoryList = <CategoryModel>[].obs;
  RxList<MenuModel> filterMenuList = <MenuModel>[].obs;

  RxBool isFilter = false.obs;

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;

  Future<void> fetchCategoryList() async {
    final token = await _secureStorage.readData('token');
    if (token == null) return;
    try {
      final response = await _apiController.fetchCategory(token);

      if (response.isOk) {
        for (var category in response.body) {
          categoryList.add(CategoryModel.fromJson(category));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> filterMenu() async {
    final token = await _secureStorage.readData('token');
    if (token == null) return;
    errorMessage("");
    isLoading(true);
    try {
      final response =
          await _apiController.filterMenu(token, filterCategoryList);

      if (response.isOk) {
        print("HI");
        filterMenuList.clear();
        final jsonList = response.body as List;
        filterMenuList.addAll(jsonList.map((item) => MenuModel.fromJson(item)));
        print('finish adding filter');
      } else {
        isError(true);
        errorMessage("Something went wrong!");
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    print("HI category controller");
    await fetchCategoryList();
  }
}
