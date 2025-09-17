import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/category_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  RxBool isFilter = false.obs;

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

  @override
  void onInit() async {
    super.onInit();
    print("HI category controller");
    await fetchCategoryList();
  }
}
