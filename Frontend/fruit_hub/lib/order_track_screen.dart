import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/order_tracking_tile.dart';

class OrderTrackScreen extends StatelessWidget {
  const OrderTrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          'Delivery Status',
          style: TextStyle(
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          children: [
            OrderTrackingTile(
              title: 'Order Taken',
              iconImageUrl: 'assets/images/icon/take-order.png',
              isDone: true,
              containerBgColor: MyColor.blueBackgroundColor,
            ),
            SizedBox(height: 50),
            OrderTrackingTile(
              title: 'Order is being prepared',
              iconImageUrl: 'assets/images/icon/prepared-order.png',
              isDone: false,
              containerBgColor: MyColor.yelloBackgroundColor,
            ),
            SizedBox(height: 50),
            OrderTrackingTile(
              title: 'Order is being delivered',
              iconImageUrl:
                  'assets/images/icon/delivery-man-riding-red-scooter.png',
              isDone: false,
              containerBgColor: MyColor.pinkBackgroundColor,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
