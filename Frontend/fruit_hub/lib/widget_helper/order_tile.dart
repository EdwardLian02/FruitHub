import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class OrderTile extends StatelessWidget {
  final String orderId;
  final String status;
  final double totalPrice;
  final VoidCallback onTrackOrder;
  final VoidCallback onCancelOrder;

  const OrderTile({
    super.key,
    required this.orderId,
    required this.status,
    required this.totalPrice,
    required this.onTrackOrder,
    required this.onCancelOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
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
                  "Order ID: $orderId",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  status,
                  style: TextStyle(
                    color: status.toLowerCase() == "delivered"
                        ? Colors.green
                        : Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Total Price
            Text(
              "Total: \$${totalPrice.toStringAsFixed(2)}",
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
