import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/basket_model.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BasketOrderTile extends StatelessWidget {
  final BasketItem basketItem;
  const BasketOrderTile({super.key, required this.basketItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColor.blueBackgroundColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Image.network(
                  basketItem.menu.imageUrl,
                  width: 55,
                  height: 55,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    basketItem.menu.name,
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  'qty: ${basketItem.qty}',
                  style: TextStyle(
                    fontSize: FontTheme.textSizeSmall,
                  ),
                ),
              ],
            ),
            Text('${basketItem.menu.price} MMK'),
          ],
        ),
      ),
    );
  }
}
