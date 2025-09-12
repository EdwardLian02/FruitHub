import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/order_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/helper/widget_constant.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/model/order_item_model.dart';
import 'package:fruit_hub/model/order_model.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel orderModel;
  const OrderDetailScreen({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.find<OrderController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          'Order Details',
          style: TextStyle(
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status Card
            _buildOrderStatusCard(),
            const SizedBox(height: 20),

            // Order Summary
            _buildSectionTitle('Order Summary'),
            const SizedBox(height: 10),
            _buildOrderSummary(),
            const SizedBox(height: 20),

            // Delivery Information
            _buildSectionTitle('Delivery Information'),
            const SizedBox(height: 10),
            _buildDeliveryInfo(),
            const SizedBox(height: 20),

            // Payment Information
            _buildSectionTitle('Payment Information'),
            const SizedBox(height: 10),
            _buildPaymentInfo(),
            const SizedBox(height: 20),

            // Order Items
            _buildSectionTitle('Order Items'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: _buildOrderItems(),
            ),

            //button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.toNamed('/order-track'),
                    style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(0.0),
                    ),
                    child: Text(
                      orderModel.status == 'D'
                          ? "Already Delivered"
                          : "Track Order",
                      style: TextStyle(
                        color: orderModel.status == 'D'
                            ? MyColor.successGreen
                            : MyColor.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Visibility(
                  visible: orderModel.status == 'P' ? true : false,
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        orderController.isOrderCancelButtonActive(false);

                        _showConfirmationPopUp(context, orderController);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 0,
                      ),
                      child: const Text(
                        "Cancel Order",
                        style: TextStyle(
                          fontSize: FontTheme.textSizeNormal,
                          color: MyColor.whiteTextColor,
                        ),
                      ),
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

  void _showProgressPopUp(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Center(
              child: CircularProgressIndicator(),
            ),
          ));
  Future<bool?> _showConfirmationPopUp(
      BuildContext context, OrderController orderController) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titlePadding: const EdgeInsets.all(20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        actionsPadding: const EdgeInsets.all(20),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Are you sure you want to",
            style: TextStyle(
              fontSize: FontTheme.textSizeLarge,
              fontWeight: FontWeight.w600,
              color: MyColor.primaryTextColor,
            ),
            children: [
              TextSpan(
                text: " CANCEL ",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: "this order?"),
            ],
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Type",
                style: TextStyle(
                  fontSize: FontTheme.textSizeSmall,
                  color: MyColor.primaryTextColor,
                ),
                children: [
                  TextSpan(
                    text: " CANCEL ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: "to confirm"),
                ],
              ),
            ),
            SizedBox(height: 10),
            CommonTextfield(
              hintText: "Cancel",
              onChanged: (value) {
                if (value == "Cancel") {
                  orderController.isOrderCancelButtonActive(true);
                } else {
                  orderController.isOrderCancelButtonActive(false);
                }
              },
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: MyColor.primaryTextColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    "No, Keep",
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                      color: MyColor.primaryTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Obx(
                () => Expanded(
                  child: ElevatedButton(
                    onPressed: orderController.isOrderCancelButtonActive.value
                        ? () async {
                            Get.back();
                            await orderController.cancelOrder(orderModel);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Yes, Cancel",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeNormal,
                        color: MyColor.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatusCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: convertStatusColor(orderModel.status),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    statusConverter(orderModel.status),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColor.primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    orderModel.id,
                    style: TextStyle(
                      color: MyColor.extraDarkenGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${orderModel.totalPrice} MMK',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: MyColor.primaryTextColor,
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow('Order Date', 'Nov 15, 2023'),
            const SizedBox(height: 8),
            _buildInfoRow('Total menus', '${orderModel.items.length} menus'),
            const SizedBox(height: 8),
            Divider(color: MyColor.darkenGreyColor),
            const SizedBox(height: 8),
            _buildInfoRow(
              'Total Amount',
              "${orderModel.totalPrice} MMK",
              isBold: true,
              valueColor: MyColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '123 Main St, City, State 12345',
              style: TextStyle(
                color: MyColor.primaryTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Estimated delivery: Nov 17, 2023',
              style: TextStyle(
                color: MyColor.extraDarkenGreyColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentInfo() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColor.lowOrangeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.credit_card,
                  size: 24, color: MyColor.primaryColor),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Credit Card',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColor.primaryTextColor,
                    ),
                  ),
                  Text(
                    'Paid on Nov 15, 2023',
                    style: TextStyle(
                      color: MyColor.extraDarkenGreyColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItems() {
    return ListView.builder(
      itemCount: orderModel.items.length,
      itemBuilder: (context, index) {
        final item = orderModel.items[index];
        return Padding(
            padding: EdgeInsets.only(bottom: 10), child: _buildOrderItem(item));
      },
    );
  }

  Widget _buildOrderItem(OrderItemModel orderItem) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0.3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: MyColor.blueBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(orderItem.menu.imageUrl),
        ),
        title: Text(
          orderItem.menu.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColor.primaryTextColor,
          ),
        ),
        subtitle: Text(
          'Qty: ${orderItem.qty}',
          style: TextStyle(color: MyColor.darkenGreyColor),
        ),
        trailing: Text(
          '\$${(orderItem.qty * orderItem.menu.price).toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColor.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,
      {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: MyColor.extraDarkenGreyColor,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? MyColor.primaryTextColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
