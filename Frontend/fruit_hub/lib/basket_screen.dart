import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fruit_hub/controller/basket_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/basket_order_tile.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_outline_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:get/get.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final basketController = Get.find<BasketController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          'My Basket',
          style: TextStyle(
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 50,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Text('Total'),
                    Obx(
                      () => Text(
                        '${basketController.totalPrice.value.toInt()} MMK',
                        style: TextStyle(
                          fontSize: FontTheme.textSizeLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: CommonButton(
                name: 'Checkout',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    enableDrag: false,
                    builder: (sheetContext) => _buildSheet(sheetContext),
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => basketController.basket.isEmpty
            ? Center(
                child: Text(
                  "No menu in the basket",
                  style: TextStyle(
                    fontSize: FontTheme.textSizeNormal,
                    color: MyColor.darkenGreyColor,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: basketController.basket.length,
                itemBuilder: (context, index) {
                  final basketItem = basketController.basket[index];
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          basketController.deleteFromBasket(index);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ]),
                    child: BasketOrderTile(
                      menuModel: basketItem['menu'],
                      qty: basketItem['qty'],
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildSheet(BuildContext sheetContext) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main sheet
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: SizedBox(
            height: 330,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Delivery Address",
                        style: TextStyle(
                          fontSize: FontTheme.textSizeLarge,
                        ),
                      ),
                    ),
                    CommonTextfield(
                      hintText:
                          "No.579, (39)ward B, Mandalay Street, North Dagon, Yangon",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10.0),
                      child: Text(
                        "Number we can call",
                        style: TextStyle(
                          fontSize: FontTheme.textSizeLarge,
                        ),
                      ),
                    ),
                    CommonTextfield(hintText: "09xxxxxxxx"),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CommonOutlineButton(
                        name: "Pay on delivery",
                        onTap: () {
                          print('hi');
                          Get.toNamed('/order-success');
                        },
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 2,
                      child: CommonButton(name: "Pay with card"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Close button
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              print('touch');
              Navigator.pop(sheetContext);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: 24),
            ),
          ),
        ),
      ],
    );
  }
}
