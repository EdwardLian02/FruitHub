import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class BasketOrderTile extends StatelessWidget {
  const BasketOrderTile({super.key});

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
                child: Image.asset(
                  'assets/images/breakfast-quinoa-and-red-fruit-salad.png',
                  width: 55,
                  height: 55,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quinoa Fruit Salad',
                  style: TextStyle(
                    fontSize: FontTheme.textSizeNormal,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '2 packs',
                  style: TextStyle(
                    fontSize: FontTheme.textSizeSmall,
                  ),
                ),
              ],
            ),
            Text('20,000 MMK'),
          ],
        ),
      ),
    );
  }
}
