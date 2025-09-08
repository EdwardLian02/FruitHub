import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/menu_model.dart';

class BasketOrderTile extends StatelessWidget {
  final MenuModel menuModel;
  final int qty;
  const BasketOrderTile(
      {super.key, required this.qty, required this.menuModel});

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
                  menuModel.imageUrl,
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
                    menuModel.name,
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  'qty: $qty',
                  style: TextStyle(
                    fontSize: FontTheme.textSizeSmall,
                  ),
                ),
              ],
            ),
            Text('${menuModel.price} MMK'),
          ],
        ),
      ),
    );
  }
}
