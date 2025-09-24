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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColor.statusRejectColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "We are sorry! Your order was rejected due to some condition.",
                  style: TextStyle(
                    fontSize: FontTheme.textSizeSmall,
                    color: MyColor.whiteTextColor,
                  ),
                ),
              ),
            ),
            OrderTrackingTile(
              isFirst: true,
              isPast: true,
              title: "Order Taken",
              description:
                  "Your order has been taken and confirmed by the admin. We will prepared your order soon",
              iconUrl: "assets/images/icon/take-order.png",
            ),
            OrderTrackingTile(
              title: "Order is Being Prepared",
              description:
                  "We are preparing your order. Will be on your way soon!",
              iconUrl: "assets/images/icon/prepared-order.png",
            ),
            OrderTrackingTile(
              isLast: false,
              title: "Delivering",
              description: "Order is on it's way. Get ready for your order",
              iconUrl: 'assets/images/icon/delivery-man-riding-red-scooter.png',
            ),
            OrderTrackingTile(
              isLast: true,
              title: "Order Received",
              description:
                  "Thank you for your purchased. I hope we will come across very often",
            ),
          ],
        ),
      ),
    );
  }
}
