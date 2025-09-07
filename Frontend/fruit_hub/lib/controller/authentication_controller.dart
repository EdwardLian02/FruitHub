import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/apiService/api_controller.dart';
import 'package:fruit_hub/model/auth_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final _authController = Get.put(ApiController());
  final secureStorage = SecureStorageService();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var isLogin = false.obs;
  var errorMessage = "".obs;
  var isLoading = false.obs;

  Future<void> checkIsLogin() async {
    final token = await secureStorage.readData("token");
    isLogin.value = (token == null) ? false : true;
  }

  Future<void> loginUser(String email, String password) async {
    final authModel =
        AuthModel.fromJson({'email': email, 'password': password});

    isLoading(true);
    errorMessage.value = "";
    try {
      final response = await _authController.login(authModel);
      if (response.isOk) {
        //isOk is true when statusCode is between 200 and 299.
        await secureStorage.writeData('token', response.body['token']);
        await secureStorage.writeData(
            'userId', response.body['user_id'].toString());
        await secureStorage.writeData('userEmail', response.body['email']);
        isLogin(true);
        Get.offNamed('/home');
      } else {
        errorMessage(response.body['detail']);
      }
    } catch (e) {
      print(e.toString());
      errorMessage("Connection error");
    } finally {
      isLoading(false);
    }
  }

  Future<void> logoutUser() async {
    await secureStorage.deleteAllData();
    Get.offNamed('/login');
  }

  @override
  void onInit() {
    super.onInit();

    checkIsLogin();
  }
}
