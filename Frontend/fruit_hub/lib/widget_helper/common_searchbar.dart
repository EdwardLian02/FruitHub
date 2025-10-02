import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class CommonSearchbar extends StatelessWidget {
  void Function(String)? onChanged;
  void Function(String)? onSubmitted;
  final bool? isEnabled;

  CommonSearchbar(
      {super.key, this.onChanged, this.onSubmitted, this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
        enabled: isEnabled ?? true,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
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
