import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class MenuRelatedController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  RxList<MenuModel> menuList = <MenuModel>[].obs;

  RxString errorMessage = "".obs;
  RxBool isLoading = false.obs;

  Future<void> fetchMenu() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;

    errorMessage("");
    isLoading(true);
    try {
      final response = await _apiController.fetchMenu(token);
      print(response.body);
      if (response.isOk) {
        for (var menu in response.body) {
          menuList.add(MenuModel.fromJson(menu));
        }
      } else {
        errorMessage("Something wrong in the backend");
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print('menu controller init');
    await fetchMenu();
  }
}
