import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_hub/controller/select_issue_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
import 'package:fruit_hub/widget_helper/issue_tile.dart';
import 'package:get/get.dart';

class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectIssueController = Get.put(SelectIssueController());
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
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemSize: 50,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  //Do rating update
                },
              ),
              SizedBox(height: 20),
              Text(
                "Select the issues you've experienced",
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: selectIssueController.issuesValue.length,
                itemBuilder: (context, index) {
                  final selectedValue =
                      selectIssueController.issuesValue[index];
                  return Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: IssueTile(
                          value: selectedValue,
                          group: selectIssueController.selectedIssueValue.value,
                          onChanged: (value) {
                            selectIssueController.onSelect(selectedValue!);
                          },
                        ),
                      ));
                },
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
              SizedBox(height: 10),
              CommonButton(name: "Submit feedback"),
            ],
          ),
        ));
  }
}
