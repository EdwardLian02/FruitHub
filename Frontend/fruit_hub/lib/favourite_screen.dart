import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          'My Favorite',
          style: TextStyle(
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
