import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/faq_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_searchbar.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

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
            CommonSearchbar(),
            SizedBox(height: 20),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "What is FruitHub",
                            style: TextStyle(
                              fontSize: FontTheme.textSizeNormal,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              faqController.toggleIsShowAnswer();
                            },
                            child: Obx(
                              () => Transform.rotate(
                                angle: faqController.isShowAnswer.isTrue
                                    ? 90 * math.pi / 180
                                    : 0,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => AnimatedContainer(
                          height:
                              faqController.animatedAnswerContainerHeight.value,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: Text(
                            "The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family.",
                            style: TextStyle(
                              fontSize: FontTheme.textSizeSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
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
