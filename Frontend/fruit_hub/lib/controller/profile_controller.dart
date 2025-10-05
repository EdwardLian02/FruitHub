import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/user_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _apiController = Get.put(ApiController());
  final _secureStorage = SecureStorageService();

  Rx<UserModel?> user = Rx<UserModel?>(null);

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;

  Future<void> fetchUserInfo() async {
    isLoading(true);
    isError(false);
    errorMessage("");

    String? token = await _secureStorage.readData('token');
    if (token == null) return;

    try {
      final response = await _apiController.fetchUserInfo(token);
      print("BEfore response is ok");
      if (response.isOk) {
        print("in response is ok");
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

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("INit");
    await fetchUserInfo();
  }
}
