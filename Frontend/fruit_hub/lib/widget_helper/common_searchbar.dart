import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class CommonSearchbar extends StatelessWidget {
  const CommonSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(Icons.search),
        ),
        backgroundColor: WidgetStateProperty.all(MyColor.lowGreyColor),
        hintText: "Search for fruit salad combo",
        elevation: WidgetStateProperty.all(0.0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ));
  }
}
