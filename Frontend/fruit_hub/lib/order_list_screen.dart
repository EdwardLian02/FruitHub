import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/order_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/order_detail_screen.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:fruit_hub/widget_helper/order_tile.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class OrderListScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        title: Text(
          'My Orders',
          style: TextStyle(
            fontSize: FontTheme.textSizeExtraLarge,
            color: MyColor.whiteTextColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            'assets/images/icon/drawer.png',
            width: 18,
            height: 18,
            color: Colors.white,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Obx(
        () => orderController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : LiquidPullToRefresh(
                backgroundColor: Colors.white,
                color: MyColor.primaryColor,
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 2));
                  await orderController.fetchOrder();
                },
                child: ListView.builder(
                  itemCount: orderController.orderList.length,
                  itemBuilder: (context, index) {
                    final orderModel = orderController.orderList[index];
                    return OrderTile(
                      orderModel: orderModel,
                      onTrackOrder: () {
                        Get.toNamed('/order-track');
                      },
                      onCancelOrder: () {},
                    );
                  },
                ),
              ),
      ),
    );
  }
}
