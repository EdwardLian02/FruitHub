import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/category_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FilterItems extends StatelessWidget {
  final CategoryModel category;

  final void Function()? onTap;
  const FilterItems({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => GestureDetector(
              onTap: onTap,
              child: Stack(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: category.isSelected.value
                            ? Border.all(
                                style: BorderStyle.solid,
                                width: 3,
                                color: Colors.green,
                              )
                            : Border.all(
                                style: BorderStyle.none,
                              )),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Image.asset(
                          'assets/images/breakfast-quinoa-and-red-fruit-salad.png'),
                    ),
                  ),
                  category.isSelected.value
                      ? Positioned(
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.white,
                                )),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              )),
        ),
        SizedBox(height: 5),
        Obx(
          () => SizedBox(
            width: 70,
            child: Text(
              category.name,
              style: TextStyle(
                fontSize: FontTheme.textSizeSmall,
                height: 1.2,
                fontWeight: category.isSelected.value
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
