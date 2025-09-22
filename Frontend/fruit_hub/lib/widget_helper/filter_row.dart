import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/category_controller.dart';
import 'package:fruit_hub/filter_screen.dart';
import 'package:fruit_hub/widget_helper/filter_items.dart';
import 'package:get/get.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return SizedBox(
      height: 120,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) {
            final category = categoryController.categoryList[index];
            return Padding(
              padding: EdgeInsets.only(right: 10),
              child: FilterItems(
                category: category,
                onTap: () async {
                  //Toggle
                  category.isSelected(!category.isSelected.value);

                  //Store the category to the filter list if the category is isSelected
                  if (category.isSelected.value) {
                    categoryController.filterCategoryList.add(category);
                  } else {
                    //Remove the category if it is exist in the filter list
                    categoryController.filterCategoryList
                        .removeWhere((element) => element == category);
                  }
                  Get.to(() => FilterScreen());
                  if (categoryController.filterCategoryList.isNotEmpty) {
                    await categoryController.filterMenu();
                  } else {
                    //if there is no filter item, navigate user back to the home page
                    Get.back();
                  }
                  // String filName = "";
                  // for (var filterCate
                  //     in categoryController.filterCategoryList) {
                  //   filName += "${filterCate.name}, ";
                  // }
                  // print(filName);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
