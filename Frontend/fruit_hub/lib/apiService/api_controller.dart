import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/auth_model.dart';
import 'package:fruit_hub/model/basket_model.dart';
import 'package:fruit_hub/services/secure_storage_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:logger/web.dart';

class ApiController extends GetConnect {
  var logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));
  @override
  void onInit() {
    print('hi api init');
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
      post('auth/user/signup/', model.toJson());

  Future<Response> logout(String token) async =>
      post('auth/user/logout/', {}, headers: {
        "Authorization": "token $token",
      });

  Future<Response> fetchMenu(String token) async => await get('menu', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchMenuByType(String token, String para) async =>
      await get('menu/type/$para', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchMenuDetail(String menuId, String token) async =>
      await get('menu/$menuId', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchOrder(String token) => get('order/', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> createOrder(
      List<BasketItem> orderItems, String token) async {
    final postData = [];
    for (var item in orderItems) {
      postData.add({'menu': item.menu.id, 'qty': item.qty});
    }

    return await post('order/', jsonEncode({"orders": postData}),
        headers: {'Authorization': 'token $token'});
  }

  Future<Response> deleteOrder(String orderId, String token) =>
      delete('order/$orderId/', headers: {'Authorization': 'token $token'});

  Future<Response> search(String parameter, String token) =>
      get('menu?search=$parameter', headers: {'Authorization': 'token $token'});

  Future<Response> createFavorite(String menuId, String token) =>
      post('favorite/favorite_api/', {
        'menu': menuId
      }, headers: {
        'Authorization': 'token $token',
      });

  Future<Response> deleteFavorite(String favId, String token) =>
      delete('favorite/favorite_api/$favId/', headers: {
        'Authorization': 'token $token',
      });
}
