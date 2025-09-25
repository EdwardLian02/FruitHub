import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/detail_screen.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/helper/function_constant.dart';
import 'package:fruit_hub/helper/widget_constant.dart';
import 'package:fruit_hub/model/order_model.dart';
import 'package:fruit_hub/order_detail_screen.dart';
import 'package:fruit_hub/widget_helper/status_badge.dart';
import 'package:get/get.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderModel;
  final VoidCallback? onTrackOrder;
  final VoidCallback? onCancelOrder;

  const OrderTile({
    super.key,
    required this.orderModel,
    this.onTrackOrder,
    this.onCancelOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: StatusBadge(status: orderModel.status)),
            SizedBox(height: 10),
            // Order ID and Status

            GestureDetector(
              onTap: () =>
                  Get.to(() => OrderDetailScreen(orderModel: orderModel)),
              child: Text(
                orderModel.id,
                style: const TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                  color: MyColor.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            // Total Price
            Text(
              currencyFormatHelper(orderModel.totalPrice),
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        Get.to(() => OrderDetailScreen(orderModel: orderModel)),
                    style: ButtonStyle(elevation: WidgetStatePropertyAll(0.0)),
                    child: Text(
                      "Detail",
                      style: TextStyle(color: MyColor.primaryTextColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
