import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_outline_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:fruit_hub/widget_helper/my_app_bar.dart';

class ManageInfoScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ManageInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          "Manage Info",
          style: TextStyle(color: MyColor.whiteTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      AssetImage("assets/images/random_person.png"),
                ),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(height: 20),
            CommonTextfield(hintText: "Name"),
            SizedBox(height: 20),
            CommonTextfield(hintText: "Email"),
            SizedBox(height: 20),
            CommonTextfield(hintText: "Phone"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: CommonOutlineButton(name: "Cancel")),
                SizedBox(width: 20),
                Expanded(child: CommonButton(name: "Save")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
