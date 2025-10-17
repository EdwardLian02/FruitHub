import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/faq_model.dart';
import 'package:get/get.dart';

class FaqTile extends StatelessWidget {
  final FaqModel faqItem;
  final void Function()? onTap;
  const FaqTile({
    super.key,
    required this.faqItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColor.lowGreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  faqItem.question,
                  style: TextStyle(
                    fontSize: FontTheme.textSizeNormal,
                  ),
                ),
                //Icon part
                GestureDetector(
                  onTap: onTap,
                  child: Obx(
                    () => Transform.rotate(
                      angle: faqItem.isShowAns.isTrue ? 270 * math.pi / 180 : 0,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),

            //Animated Size
            Obx(
              () => AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut,
                child: faqItem.isShowAns.isTrue
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Divider(),
                          ),
                          Text(
                            faqItem.answer,
                            style: TextStyle(
                              fontSize: FontTheme.textSizeSmall,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
            ),
          ],
        ));
  }
}
