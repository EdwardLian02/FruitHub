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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      //Filter button section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Filter ",
                            style: TextStyle(
                              fontSize: FontTheme.textSizeNormal,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: MyColor.darkenGreyColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButton(
                                    style: TextStyle(
                                      fontSize: FontTheme.textSizeSmall,
                                      color: MyColor.primaryTextColor,
                                    ),
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(10),
                                    hint: Text("filter by status"),
                                    value:
                                        orderController.filterStatusValue.value,
                                    alignment: Alignment.center,
                                    items: [
                                      DropdownMenuItem(
                                        value: '',
                                        child: Text("All"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'P',
                                        child: Text("Pending"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'R',
                                        child: Text("Reject"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'PP',
                                        child: Text("Being Prepared"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'BD',
                                        child: Text("Being Delivered"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'D',
                                        child: Text("Delivered"),
                                      ),
                                    ],
                                    onChanged: (value) async {
                                      orderController.filterStatusValue(value);
                                      if (value == "") {
                                        await orderController.fetchOrder();
                                      } else {
                                        await orderController.filterOrder();
                                      }
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
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
                    ],
                  ),
                )),
      ),
    );
  }
}
