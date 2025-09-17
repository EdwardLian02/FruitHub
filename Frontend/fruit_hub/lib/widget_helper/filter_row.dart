import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/category_controller.dart';
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
                onTap: () {
                  //Toggle
                  category.isSelected(!category.isSelected.value);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
