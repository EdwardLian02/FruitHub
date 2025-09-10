import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: ListView(
          children: [
            //Profile info display section
            Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    'assets/images/buutee_profile_image.png',
                  ),
                )
              ],
            ),

            //List tile section (List items)
            GestureDetector(
              onTap: () {
                Get.back();
                Get.offNamed('/home');
              },
              child: ListTile(
                leading: Icon(Icons.home, size: 30),
                title: Text("Home"),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.back();
                Get.offNamed('/favorite');
              },
              child: ListTile(
                leading: Icon(Icons.favorite, size: 30),
                title: Text("favorite"),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.back();
                Get.offNamed('/order');
              },
              child: ListTile(
                leading: Icon(Icons.sort, size: 30),
                title: Text("Order"),
              ),
            ),

            ListTile(
              leading: Icon(Icons.settings, size: 30),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
