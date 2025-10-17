import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: MyColor.primaryColor,
          foregroundColor: MyColor.whiteTextColor,
          title: Text(
            "Rate Us",
            style: TextStyle(color: MyColor.whiteTextColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Share Your Feedback",
                style: TextStyle(
                  fontSize: FontTheme.textSizeExtraLarge,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Rate Your Experience",
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: Placeholder(),
              ),
              SizedBox(height: 10),
              Text(
                "Select the issues you've experienced",
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {},
              )),
              Text(
                "Your Comment",
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                ),
              ),
              SizedBox(height: 10),
              CommonTextfield(
                hintText: "write something",
                maxLines: 4,
              ),
            ],
          ),
        ));
  }
}
