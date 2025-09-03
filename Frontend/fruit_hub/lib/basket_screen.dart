import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/basket_order_tile.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 50,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Text('Total'),
                  Text(
                    '10,000 MMK',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeLarge,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CommonButton(name: 'Checkout'),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          BasketOrderTile(),
          BasketOrderTile(),
        ],
      ),
    );
  }
}
