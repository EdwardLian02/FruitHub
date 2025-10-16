import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/address_model.dart';
import 'package:fruit_hub/model/auth_model.dart';
import 'package:fruit_hub/model/basket_model.dart';
import 'package:fruit_hub/model/category_model.dart';
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

  Future<Response> fetchUserInfo(String token) async =>
      get('api/user', headers: {
        "Authorization": "token $token",
      });

  Future<Response> updateUserInfo({
    required String token,
    required int userId,
    required Map<String, dynamic> updateData,
  }) =>
      patch("api/user/$userId/", jsonEncode(updateData), headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchMenu(String token) async =>
      await get('api/menu', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchCategory(String token) async {
    return await get('api/menu/category', headers: {
      "Authorization": "Token $token",
    });
  }

  Future<Response> filterMenu(
      String token, List<CategoryModel> filterList) async {
    //Filter url format
    // /menu/menu_api?category=[ID]&category=[ID]

    String filterUrl = "";
    //concat filter url
    for (var filCat in filterList) {
      filterUrl += "category=${filCat.id}&";
    }
    return await get('api/menu?$filterUrl',
        headers: {'Authorization': 'token $token'});
  }

  Future<Response> fetchMenuByType(String token, String para) async =>
      await get('api/menu/type/$para', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchMenuDetail(String menuId, String token) async =>
      await get('api/menu/$menuId', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> fetchAddress(String token) async =>
      await get('api/user/address', headers: {'Authorization': 'token $token'});

  Future<Response> createAddress(String token, address) async {
    return await post('api/user/address/', jsonEncode(address), headers: {
      'Authorization': 'token $token',
    });
  }

  Future<Response> updateAddress(String token, address) async =>
      await patch('api/user/address/${address['id']}/', jsonEncode(address),
          headers: {'Authorization': 'token $token'});

  Future<Response> deleteAddress(String token, addressId) async =>
      await delete('api/user/address/$addressId/',
          headers: {'Authorization': 'token $token'});

  Future<Response> fetchOrder(String token) => get('api/order', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> filterOrder(String token, String value) =>
      get('api/order?status=$value', headers: {
        'Authorization': 'token $token',
      });

  Future<Response> createOrder(
      List<BasketItem> orderItems, String token) async {
    final postData = [];
    for (var item in orderItems) {
      postData.add({'menu': item.menu.id, 'qty': item.qty});
    }

    return await post('api/order/', jsonEncode({"orders": postData}),
        headers: {'Authorization': 'token $token'});
  }

  Future<Response> deleteOrder(String orderId, String token) =>
      delete('order/$orderId', headers: {'Authorization': 'token $token'});

  Future<Response> search(String parameter, String token) =>
      get('api/menu?search=$parameter',
          headers: {'Authorization': 'token $token'});

  Future<Response> createFavorite(String menuId, String token) =>
      post('api/favorite/', {
        'menu': menuId
      }, headers: {
        'Authorization': 'token $token',
      });

  Future<Response> deleteFavorite(String favId, String token) =>
      delete('api/favorite/$favId/', headers: {
        'Authorization': 'token $token',
      });
}
