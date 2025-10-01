import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/favorite_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/menu_card.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            'assets/images/icon/drawer.png',
            width: 18,
            height: 18,
            color: MyColor.whiteTextColor,
          ),
        ),
        title: Text(
          "My Favorite",
          style: TextStyle(
            color: MyColor.whiteTextColor,
            fontSize: FontTheme.textSizeExtraLarge,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GridView.builder(
            itemCount: favoriteController.favoriteList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              print('in item builder');
              final menuModel = favoriteController.favoriteList[index];
              return GestureDetector(
                onTap: () {},
                child: MenuCard(menuModel: menuModel),
              );
            },
          ),
        ),
      ),
    );
  }
}
