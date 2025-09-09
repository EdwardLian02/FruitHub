import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_searchbar.dart';
import 'package:fruit_hub/controller/search_controller.dart' as searchC;
import 'package:fruit_hub/widget_helper/menu_card.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = Get.put(searchC.SearchController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          'Search',
          style: TextStyle(
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Obx(
          () => Column(
            children: [
              CommonSearchbar(
                onSubmitted: (parameter) async {
                  await _searchController.searchMenu();
                },
                onChanged: (value) {
                  _searchController.searchPara(value);
                },
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                      text: _searchController.errorMessage.isEmpty
                          ? "Result: "
                          : "",
                      style: TextStyle(color: MyColor.primaryTextColor),
                      children: [
                        TextSpan(
                          text: _searchController.errorMessage.isEmpty
                              ? _searchController.searchMenuList.isEmpty
                                  ? "No search result"
                                  : "${_searchController.searchMenuList.length} results are found"
                              : "",
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => _searchController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Obx(
                      () => Expanded(
                        child: GridView.builder(
                          itemCount: _searchController.searchMenuList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.8),
                          itemBuilder: (context, index) {
                            final menuModel =
                                _searchController.searchMenuList[index];
                            return MenuCard(menuModel: menuModel);
                          },
                        ),

                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: _searchController.searchMenuList.length,
                        //   itemBuilder: (context, index) {
                        //     final menuModel =
                        //         _searchController.searchMenuList[index];
                        //     return MenuCard(menuModel: menuModel);
                        //   },
                        // ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
