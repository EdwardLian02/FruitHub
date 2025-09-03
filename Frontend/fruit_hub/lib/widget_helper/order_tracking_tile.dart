import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/circle_icon_button.dart';

class OrderTrackingTile extends StatelessWidget {
  final String title;
  final String iconImageUrl;
  final Color containerBgColor;
  final bool isDone;
  const OrderTrackingTile(
      {super.key,
      required this.title,
      required this.containerBgColor,
      required this.isDone,
      required this.iconImageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: containerBgColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(iconImageUrl),
              ),
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: FontTheme.textSizeLarge,
              ),
            ),
          ],
        ),
        CircleIconButton(
          haveBorder: isDone ? false : true,
          icon: isDone
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Icon(
                  Icons.check,
                  color: Colors.black,
                ),
          buttonColor: isDone ? MyColor.successGreen : Colors.transparent,
        ),
      ],
    );
  }
}
