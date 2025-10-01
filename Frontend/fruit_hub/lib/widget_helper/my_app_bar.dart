import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final bool isLeadingIcon;
  final bool isDrawerIcon;
  const MyAppBar({
    super.key,
    required this.scaffoldKey,
    required this.title,
    this.isLeadingIcon = true,
    this.isDrawerIcon = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: MyColor.primaryColor,
      automaticallyImplyLeading: isLeadingIcon,
      leading: isDrawerIcon
          ? IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Image.asset(
                'assets/images/icon/drawer.png',
                width: 18,
                height: 18,
                color: MyColor.whiteTextColor,
              ),
            )
          : Icon(
              Icons.arrow_back,
            ),
      title: Text(
        title,
        style: TextStyle(
          color: MyColor.whiteTextColor,
          fontSize: FontTheme.textSizeExtraLarge,
        ),
      ),
    );
  }
}
