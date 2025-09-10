import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/order_model.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID: \n${orderModel.id}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(orderModel.status),
              ],
            ),
            const SizedBox(height: 8),

            // Total Price
            Text(
              "Total: ${orderModel.totalPrice.toStringAsFixed(2)} MMK",
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 12),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: onTrackOrder,
                  child: Text(
                    "Track Order",
                    style: TextStyle(color: MyColor.primaryTextColor),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onCancelOrder,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Cancel Order",
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                      color: MyColor.whiteTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
