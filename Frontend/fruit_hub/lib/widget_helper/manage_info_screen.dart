import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/profile_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/loading_screen.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_outline_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:get/get.dart';

class ManageInfoScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Photo upload section
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
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),

                    //Textfield section
                    CommonTextfield(
                      controller: profileController.nameController,
                      hintText: "Name",
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Name should be ADDED";
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CommonTextfield(
                      controller: profileController.phoneController,
                      hintText: "Phone",
                    ),
                    SizedBox(height: 20),

                    //Save & Cancel button row
                    Row(
                      children: [
                        Expanded(
                            child: CommonOutlineButton(
                                onTap: () => Get.back(), name: "Cancel")),
                        SizedBox(width: 20),
                        Expanded(
                          child: CommonButton(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  final updatedData = {
                                    "username":
                                        profileController.nameController.text,
                                    "user_phone":
                                        profileController.phoneController.text,
                                  };

                                  await profileController.updateUserInfo(
                                      profileController.user.value!.id,
                                      updatedData);
                                }
                              },
                              name: "Save"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => profileController.isLoading.isTrue
                ? LoadingScreen()
                : Container()),
          ],
        ));
  }
}
