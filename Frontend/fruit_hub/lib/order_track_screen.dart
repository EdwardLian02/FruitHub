import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/order_model.dart';
import 'package:fruit_hub/widget_helper/message_card_widget.dart';
import 'package:fruit_hub/widget_helper/order_tracking_tile.dart';
import 'package:fruit_hub/widget_helper/order_tracking_widget_section.dart';

class OrderTrackScreen extends StatelessWidget {
  final OrderModel orderModel;
  const OrderTrackScreen({super.key, required this.orderModel});

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
            MessageCardWidget(status: orderModel.status),
            OrderTrackingWidgetSection(orderModel: orderModel),
          ],
        ),
      ),
    );
  }
}
