import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/profile_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/loading_screen.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_outline_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:fruit_hub/widget_helper/my_app_bar.dart';
import 'package:get/get.dart';

class ManageInfoScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ManageInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
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
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            profileController.user.value!.profilePic),
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
                  CommonTextfield(
                    controller: profileController.nameController,
                    hintText: "Name",
                  ),
                  SizedBox(height: 20),
                  CommonTextfield(
                    controller: profileController.phoneController,
                    hintText: "Phone",
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: CommonOutlineButton(
                              onTap: () => Get.back(), name: "Cancel")),
                      SizedBox(width: 20),
                      Expanded(
                        child: CommonButton(
                            onTap: () async {
                              final updatedData = {
                                "username":
                                    profileController.nameController.text,
                                "user_phone":
                                    profileController.phoneController.text,
                              };

                              await profileController.updateUserInfo(
                                  profileController.user.value!.id,
                                  updatedData);
                            },
                            name: "Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() => profileController.isLoading.isTrue
                ? LoadingScreen()
                : Container()),
          ],
        ));
  }
}
