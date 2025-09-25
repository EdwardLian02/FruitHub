import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:fruit_hub/widget_helper/profile_item_tile.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            'assets/images/icon/drawer.png',
            width: 18,
            height: 18,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Profile image part
            _buildProfileImagePart(),
            SizedBox(height: 20),

            //build name part
            _buildNamePart(),
            SizedBox(height: 40),

            //build profile item
            _buildProfileTileSection(),
            SizedBox(height: 30),

            _buildSettingTileSection(),
            SizedBox(height: 50),

            //Button Row
            _buildButtonRow(authController),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileImagePart() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/random_person.png',
          width: 160,
          height: 160,
          fit: BoxFit.cover,
        ),
      ),
      Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Joined",
            style: TextStyle(
              fontSize: FontTheme.textSizeNormal,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "2 years ago",
            style: TextStyle(
              fontSize: FontTheme.textSizeLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    ],
  );
}

Widget _buildNamePart() {
  return RichText(
      text: TextSpan(
    text: "David\n",
    style: TextStyle(
      fontSize: FontTheme.textSizeExtraLarge,
      color: MyColor.primaryTextColor,
      fontWeight: FontWeight.bold,
    ),
    children: <TextSpan>[
      TextSpan(
          text: "Robinson",
          style: TextStyle(
            color: Colors.grey,
          )),
    ],
  ));
}

Widget _buildProfileTileSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Profile",
        style: TextStyle(
          fontSize: FontTheme.textSizeLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/manage_info.png',
          width: 30,
          color: MyColor.primaryColor,
        ),
        title: "Manage Info",
        lowBackgroundColor: MyColor.lowOrangeColor,
      ),
    ],
  );
}

Widget _buildSettingTileSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Setting",
        style: TextStyle(
          fontSize: FontTheme.textSizeLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Icon(
          Icons.notifications_on_outlined,
          size: 30,
          color: Colors.purple,
        ),
        lowBackgroundColor: Colors.purple.shade50,
        title: "Notifications",
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/moon.png',
          width: 30,
          color: Colors.blue,
        ),
        lowBackgroundColor: Colors.blue.shade50,
        title: "Dark Mode",
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/language.png',
          width: 30,
          color: Colors.red,
        ),
        lowBackgroundColor: Colors.red.shade50,
        title: "Dark Mode",
      ),
    ],
  );
}

Widget _buildButtonRow(AuthenticationController authController) {
  return ElevatedButton(
    onPressed: () {
      authController.logoutUser();
    },
    style: ButtonStyle(
      elevation: WidgetStatePropertyAll(0.0),
    ),
    child: Text(
      "Sign out",
      style: TextStyle(
        fontSize: FontTheme.textSizeNormal,
        color: MyColor.primaryTextColor,
      ),
    ),
  );
}
