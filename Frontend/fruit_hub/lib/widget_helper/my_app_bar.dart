import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  const MyAppBar({super.key, required this.scaffoldKey, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: MyColor.primaryColor,
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        icon: Image.asset(
          'assets/images/icon/drawer.png',
          width: 18,
          height: 18,
          color: MyColor.whiteTextColor,
        ),
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
