import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/helper/widget_constant.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  @override
  const StatusBadge({super.key, required this.status});

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: convertStatusColor(status),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          statusConverter(status),
          style: TextStyle(
            fontSize: FontTheme.textSizeSmall,
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
    );
  }
}
