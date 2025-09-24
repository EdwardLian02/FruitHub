import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingTile extends StatelessWidget {
  final String title;
  final String description;
  final String? iconUrl;
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  const OrderTrackingTile({
    super.key,
    required this.title,
    required this.description,
    this.iconUrl,
    this.isFirst = false,
    this.isLast = false,
    this.isPast = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
            width: 50,
            height: 50,
            color: isPast ? MyColor.successGreen : Colors.grey,
            iconStyle: isPast
                ? IconStyle(
                    iconData: Icons.check, color: MyColor.whiteTextColor)
                : null,
            indicator: iconUrl != null
                ? Container(
                    decoration: BoxDecoration(
                      color: isPast ? MyColor.primaryColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(iconUrl!),
                  )
                : null),
        beforeLineStyle: LineStyle(
          color: isPast ? MyColor.primaryColor : Colors.grey,
        ),
        hasIndicator: true,
        endChild: Container(
          margin: EdgeInsets.only(top: 40, right: 10, left: 10),
          decoration: BoxDecoration(
            color: isPast ? MyColor.primaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: FontTheme.textSizeLarge,
                    color: MyColor.whiteTextColor,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: FontTheme.textSizeSmall,
                    color: MyColor.whiteTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
