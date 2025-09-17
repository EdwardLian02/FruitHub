import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/authentication_controller.dart';
import 'package:fruit_hub/controller/basket_controller.dart';
import 'package:fruit_hub/controller/category_controller.dart';
import 'package:fruit_hub/controller/menu_controller.dart';
import 'package:fruit_hub/detail_screen.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/search_screen.dart';
import 'package:fruit_hub/widget_helper/common_searchbar.dart';
import 'package:fruit_hub/widget_helper/filter_items.dart';
import 'package:fruit_hub/widget_helper/filter_row.dart';
import 'package:fruit_hub/widget_helper/menu_card.dart';
import 'package:fruit_hub/widget_helper/my_drawer.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthenticationController>();

    final menuRelatedController = Get.put(MenuRelatedController());
    final categoryController = Get.put(CategoryController());
    final basketController = Get.find<BasketController>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColor.whiteTextColor,
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
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/basket');
            },
            icon: Icon(
              Icons.shopping_basket,
              color: MyColor.primaryColor,
              size: 25,
            ),
          ),
          IconButton(
              onPressed: () {
                authController.logoutUser();
              },
              icon: Icon(
                Icons.logout,
                size: 25,
                color: Colors.red,
              )),
        ],
      ),
      drawer: MyDrawer(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Welcome text section
              SizedBox(
                width: 300,
                child: RichText(
                  text: TextSpan(
                      text: "Hello Tony, ",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeLarge,
                        color: MyColor.primaryTextColor,
                        letterSpacing: 1,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "What fruit salad combo do you want today?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                      ]),
                ),
              ),

              //Search bar section
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => SearchScreen());
                      },
                      child: CommonSearchbar(
                        isEnabled: false,
                      ), // Your search bar widget
                    ),
                  ),
                  SizedBox(width: 20),
                  Obx(
                    () => IconButton(
                      onPressed: () {
                        categoryController
                            .isFilter(!categoryController.isFilter.value);
                      },
                      icon: Image.asset(
                        'assets/images/icon/filter.png',
                        color: categoryController.isFilter.value
                            ? Colors.white
                            : Colors.black,
                      ),
                      style: ButtonStyle(
                        backgroundColor: categoryController.isFilter.value
                            ? WidgetStatePropertyAll(MyColor.primaryColor)
                            : null,
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10),

              //Filter by category section
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Obx(
                  () => categoryController.isFilter.value
                      ? FilterRow()
                      : SizedBox.shrink(),
                ),
              ),

              SizedBox(height: 10),
              //Recommended Combo section
              Text(
                'Recommended Combo',
                style: TextStyle(fontSize: FontTheme.textSizeExtraLarge),
              ),
              SizedBox(height: 15),

              Obx(
                () => SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuRelatedController.menuList.length,
                    itemBuilder: (context, index) {
                      final menu = menuRelatedController.menuList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            basketController.clearCounter();
                            if (menu.isInBasket.value) {
                              basketController
                                  .setAlreadyInBasketMenuQtyInDetailScreen(
                                      menu.id);
                            }

                            Get.to(() => DetailScreen(
                                  menuModel: menu,
                                ));
                          },
                          child: MenuCard(
                            menuModel: menu,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              //Category Section
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  indicatorColor: MyColor.primaryColor,
                  indicatorAnimation: TabIndicatorAnimation.linear,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2,
                      color: MyColor.primaryColor,
                    ),
                    insets: EdgeInsets.only(right: 20),
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: FontTheme.textSizeSmall,
                  ),
                  labelStyle: TextStyle(
                    fontSize: FontTheme.textSizeLarge,
                    fontWeight: FontWeight.w500,
                    color: MyColor.primaryTextColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Hottest"),
                    Tab(text: "Popular"),
                    Tab(text: "New Combo"),
                    Tab(text: "Top"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // SizedBox(
              //   height: 240,
              //   child: TabBarView(children: [
              //     ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: EdgeInsets.only(right: 10),
              //           child: MenuCard(),
              //         );
              //       },
              //     ),
              //     ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: EdgeInsets.only(right: 10),
              //           child: MenuCard(),
              //         );
              //       },
              //     ),
              //     ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: EdgeInsets.only(right: 10),
              //           child: MenuCard(),
              //         );
              //       },
              //     ),
              //     ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 4,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: EdgeInsets.only(right: 10),
              //           child: MenuCard(),
              //         );
              //       },
              //     ),
              //   ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
