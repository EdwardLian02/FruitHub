import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class ProfileItemTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color lowBackgroundColor;
  const ProfileItemTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.lowBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lowBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
        ),
        title: Text(title),
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColor.lowGreyColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ));
  }
}
