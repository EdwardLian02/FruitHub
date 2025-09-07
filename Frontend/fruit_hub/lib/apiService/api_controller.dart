import 'package:flutter/foundation.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/auth_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:logger/web.dart';

class ApiController extends GetConnect {
  var logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));
  @override
  void onInit() {
    //Every request will start from this base URL, so you don’t repeat it in every API call.
    httpClient.baseUrl = BaseUrl.baseUrl;

    //If an API request takes more than 30 seconds, it fails automatically.
    httpClient.timeout = const Duration(seconds: 30);

    //Runs before sending a request.
    httpClient.addRequestModifier((Request request) async {
      if (kDebugMode) {
        if (request.method == 'get') {
          logger.w(
              'http method ${request.method} =====> ${request.url.path} ${request.url.queryParameters}');
        }

        if (request.method == 'post') {
          logger.w(
              'http method ${request.method} =====> ${request.url.path} ${await request.bodyBytes.bytesToString()}');
        }
      }

      return request;
    });

    //Runs after receiving a response.
    httpClient.addResponseModifier((request, response) async {
      if (kDebugMode) {
        logger.i(response.body);
      }

      return response;
    });
    // TODO: implement onInit
    super.onInit();
  }

  Future<Response> login(AuthModel model) async =>
      post('auth/user/login/', model.toJson());

  Future<Response> register(AuthModel model) async =>
      post('auth/user/register/', model.toJson());
}
