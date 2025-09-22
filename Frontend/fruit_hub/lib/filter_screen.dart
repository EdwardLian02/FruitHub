import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/category_controller.dart';
import 'package:fruit_hub/widget_helper/filter_row.dart';
import 'package:fruit_hub/widget_helper/menu_card.dart';
import 'package:fruit_hub/widget_helper/my_app_bar.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:get/get.dart';

class FilterScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Hero(
              tag: "filter",
              child: FilterRow(),
            ),
            SizedBox(height: 20),
            Obx(
              () => Expanded(
                child: GridView.builder(
                  itemCount: categoryController.filterMenuList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final menu = categoryController.filterMenuList[index];
                    return MenuCard(menuModel: menu);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
