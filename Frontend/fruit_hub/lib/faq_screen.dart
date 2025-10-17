import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/faq_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_searchbar.dart';
import 'package:fruit_hub/widget_helper/faq_tile.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqController = Get.put(FaqController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          "FAQ",
          style: TextStyle(color: MyColor.whiteTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We are here to help you",
              style: TextStyle(
                fontSize: FontTheme.textSizeExtraLarge,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "We have got you covered share your concern or check our frequently asked questions listed below. ",
              style: TextStyle(
                fontSize: FontTheme.textSizeNormal,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: faqController.faqList.length,
                itemBuilder: (context, index) {
                  final faqItem = faqController.faqList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FaqTile(
                      faqItem: faqItem,
                      onTap: () => faqController.toggleIsShowAnswer(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _buildFaqList(){
//   return
// }
