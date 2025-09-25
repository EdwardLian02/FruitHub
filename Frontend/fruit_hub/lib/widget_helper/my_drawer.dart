import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: ListView(
          children: [
            //Profile info display section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "David Robison",
                  style: TextStyle(
                    fontSize: FontTheme.textSizeLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.toNamed('/profile');
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: MyColor.extraDarkenGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            //List tile section (List items)
            GestureDetector(
              onTap: () {
                Get.back();
                Get.offNamed('/home');
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.lowOrangeColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/icon/home_icon.png',
                      width: 25,
                      color: MyColor.primaryColor,
                    ),
                  ),
                ),
                title: Text("Home"),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.back();
                Get.offNamed('/favorite');
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.lowOrangeColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/icon/favorite_icon.png',
                      width: 25,
                      color: MyColor.primaryColor,
                    ),
                  ),
                ),
                title: Text("Favorite"),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.back();
                Get.offNamed('/order');
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.lowOrangeColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/icon/order_icon.png',
                      width: 25,
                      color: MyColor.primaryColor,
                    ),
                  ),
                ),
                title: Text("Orders"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
