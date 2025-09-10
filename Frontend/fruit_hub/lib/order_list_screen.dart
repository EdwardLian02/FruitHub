import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/order_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:fruit_hub/widget_helper/order_tile.dart';
import 'package:get/get.dart';

class OrderListScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(
            fontSize: FontTheme.textSizeExtraLarge,
            color: MyColor.primaryColor,
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
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Obx(
        () => orderController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: orderController.orderList.length,
                itemBuilder: (context, index) {
                  final orderModel = orderController.orderList[index];
                  return OrderTile(
                    orderModel: orderModel,
                    onCancelOrder: () {},
                  );
                },
              ),
      ),
    );
  }
}
