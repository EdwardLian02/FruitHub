import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:fruit_hub/widget_helper/order_tile.dart';

class OrderListScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: MyColor.primaryColor,
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
      body: Column(
        children: [
          OrderTile(
            orderId: "12345",
            status: "Processing",
            totalPrice: 49.99,
            onTrackOrder: () {
              print("Tracking order 12345");
            },
            onCancelOrder: () {
              print("Cancelled order 12345");
            },
          ),
        ],
      ),
    );
  }
}
