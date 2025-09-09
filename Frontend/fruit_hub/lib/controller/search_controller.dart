import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:fruit_hub/widget_helper/messenger_helper.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  RxString searchPara = "".obs;
  List<MenuModel> searchMenuList = <MenuModel>[].obs;
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> searchMenu() async {
    String? token = await _secureStorage.readData('token');
    if (token == null) return;

    searchMenuList.clear();
    errorMessage("");
    isLoading(true);
    try {
      final response = await _apiController.search(searchPara.value, token);
      print(response.body);

      if (response.isOk) {
        for (var menu in response.body) {
          searchMenuList.add(MenuModel.fromJson(menu));
        }
      } else {
        errorMessage("Something went wrong!");
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //Listen error message for every changes
    ever(errorMessage, (String errorMessage) {
      if (errorMessage.isNotEmpty) {
        MessengerHelper.showErrorToasteMessage(errorMessage);
      }
    });
  }
}
