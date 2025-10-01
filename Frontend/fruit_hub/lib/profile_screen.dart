import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/controller/scroll_controller.dart';
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
    final scrollController = Get.put(ScrollableController());

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      // appBar:
      // AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       _scaffoldKey.currentState?.openDrawer();
      //     },
      //     icon: Image.asset(
      //       'assets/images/icon/drawer.png',
      //       width: 18,
      //       height: 18,
      //     ),
      //   ),
      // ),
      drawer: MyDrawer(),
      body: CustomScrollView(
        shrinkWrap: true,
        controller: scrollController.scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyColor.primaryColor,
            expandedHeight: 350,
            toolbarHeight: 100,
            pinned: true,
            centerTitle: false,
            title: Obx(
              () => scrollController.isShowPinnedAppBar.isTrue
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Image.asset(
                            'assets/images/icon/drawer.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "John Robinsom",
                                    style: TextStyle(
                                      fontSize: FontTheme.textSizeNormal,
                                      color: MyColor.whiteTextColor,
                                    ),
                                  ),
                                  Text(
                                    "john34@gmail.com",
                                    style: TextStyle(
                                      fontSize: FontTheme.textSizeNormal,
                                      color: MyColor.whiteTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                    "assets/images/random_person.png"),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileImagePart(),
                    SizedBox(height: 20),
                    Text(
                      "David Robison Junior",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeExtraLarge,
                        color: MyColor.whiteTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "davidjohn12@gmail.com",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeNormal,
                        color: MyColor.lowGreyColor,
                      ),
                    ),
                    Text(
                      "+959234224343",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeNormal,
                        color: MyColor.lowGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SliverFillRemaining(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 30),
          //     child: Column(
          //       children: [
          //         SizedBox(height: 20),
          //         _buildProfileTileSection(),
          //         SizedBox(height: 30),
          //         _buildSettingTileSection(),
          //         SizedBox(height: 30),
          //         _buildButtonRow(authController),
          //       ],
          //     ),
          //   ),
          // ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildProfileTileSection(),
                  SizedBox(height: 30),
                  _buildSettingTileSection(),
                  SizedBox(height: 30),
                  _buildAboutTileSection(),
                  SizedBox(height: 30),
                  _buildButtonRow(authController),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildProfileImagePart() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
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
              color: MyColor.lowGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "2 years ago",
            style: TextStyle(
              fontSize: FontTheme.textSizeLarge,
              fontWeight: FontWeight.bold,
              color: MyColor.whiteTextColor,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildNamePart() {
  // return RichText(
  //     text: TextSpan(
  //   text: "David\n",
  //   style: TextStyle(
  //     fontSize: FontTheme.textSizeExtraLarge,
  //     color: MyColor.primaryTextColor,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   children: <TextSpan>[
  //     TextSpan(
  //         text: "Robinson",
  //         style: TextStyle(
  //           color: Colors.grey,
  //         )),
  //   ],
  // ));

  return Text(
    "David Robison Junior",
    style: TextStyle(
      fontSize: FontTheme.textSizeExtraLarge,
      color: MyColor.primaryTextColor,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _buildProfileTileSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 20),
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
        onTap: () => Get.toNamed('/manage-info'),
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/location_icon.png',
          width: 30,
          color: MyColor.primaryColor,
        ),
        title: "Address",
        lowBackgroundColor: MyColor.lowOrangeColor,
        onTap: () => Get.toNamed('/manage-info'),
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
        title: "Language",
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          "assets/images/icon/security_icon.png",
          width: 30,
          color: Colors.black,
        ),
        title: "Security",
        lowBackgroundColor: MyColor.lowGreyColor,
      )
    ],
  );
}

Widget _buildAboutTileSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "About",
        style: TextStyle(
          fontSize: FontTheme.textSizeLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/faq_icon.png',
          width: 30,
          color: Colors.purple,
        ),
        lowBackgroundColor: Colors.purple.shade50,
        title: "FAQ",
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/aboutus_icon.png',
          width: 30,
          color: Colors.blue,
        ),
        lowBackgroundColor: Colors.blue.shade50,
        title: "About Us",
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          'assets/images/icon/rate_icon.png',
          width: 30,
          color: Colors.red,
        ),
        lowBackgroundColor: Colors.red.shade50,
        title: "Rate Us",
      ),
      SizedBox(height: 10),
      ProfileItemTile(
        icon: Image.asset(
          "assets/images/icon/policy_icon.png",
          width: 30,
          color: Colors.black,
        ),
        title: "Privacy Policy",
        lowBackgroundColor: MyColor.lowGreyColor,
      ),
    ],
  );
}

Widget _buildButtonRow(AuthenticationController authController) {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
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
              color: Colors.red,
            ),
          ),
        ),
      )
    ],
  );
}
