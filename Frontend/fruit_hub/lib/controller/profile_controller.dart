import 'package:flutter/widgets.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/user_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:fruit_hub/widget_helper/messenger_helper.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  Rx<UserModel?> user = Rx<UserModel?>(null);

  late final TextEditingController nameController;

  late final TextEditingController phoneController;

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;

  Future<void> fetchUserInfo() async {
    isLoading(true);
    isError(false);
    errorMessage("");

    String? token = await _secureStorage.readData('token');
    if (token == null) return;
    resetVariable();
    try {
      final response = await _apiController.fetchUserInfo(token);
      print("BEfore response is ok");
      if (response.isOk) {
        user.value = UserModel.fromJson(response.body[0]);

        print("Assigned user info!");
      } else {
        isError(true);
        errorMessage("Something went wrong");
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void assignTextController() {
    nameController.text = user.value!.username ?? "";
    phoneController.text = user.value!.userPhone ?? "";
  }

  Future<void> updateUserInfo(
      int userId, Map<String, dynamic> updateData) async {
    String? token = await _secureStorage.readData("token");
    if (token == null) return;

    resetVariable();

    try {
      final response = await _apiController.updateUserInfo(
          token: token, userId: userId, updateData: updateData);
      if (response.isOk) {
        user.value = UserModel.fromJson(response.body);
        MessengerHelper.showSuccessToasteMessage("User Info Updated");
        Get.offNamed('profile');
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void resetVariable() {
    isLoading(true);
    isError(false);
    errorMessage("");
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await fetchUserInfo();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    print("Finish initializing controller");
  }
}
