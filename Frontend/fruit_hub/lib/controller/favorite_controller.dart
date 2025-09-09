import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:fruit_hub/widget_helper/messenger_helper.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStroage = SecureStorageService();

  RxString errorMessage = "".obs;

  Future<void> createFavorite(MenuModel menu) async {
    final token = await _secureStroage.readData('token');

    if (token == null) return;

    try {
      final response = await _apiController.createFavorite(menu.id, token);

      if (response.isOk) {
        menu.favoriteId = response.body['id'];
        menu.isFavorite.value = true;
        MessengerHelper.showSuccessToasteMessage("Added to favorite");
      } else {
        errorMessage('Something went wrong');
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<void> deleteFavorite(MenuModel menu) async {
    final token = await _secureStroage.readData('token');

    if (token == null) return;

    try {
      final response =
          await _apiController.deleteFavorite(menu.favoriteId!, token);
      print(response.body);
      if (response.isOk) {
        menu.isFavorite.value = false;
        MessengerHelper.showErrorToasteMessage("Removed from Favorite");
      } else {
        errorMessage('Something went wrong');
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }
}
