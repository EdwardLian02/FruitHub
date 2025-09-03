import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/congratulation_animation_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_outline_button.dart';
import 'package:get/get.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CongratulationAnimationController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Success Icon section
            Stack(
              children: [
                ScaleTransition(
                  scale: controller.animationController,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: MyColor.lowGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: MyColor.successGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Congradulation text section
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Congratulations!!!',
                style: TextStyle(
                  fontSize: FontTheme.textSizeExtraLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: 300,
                child: Text(
                  'Your order have been taken and is being attended to',
                  style: TextStyle(
                    fontSize: FontTheme.textSizeLarge,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            //Button section
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                  width: 150,
                  child: CommonButton(
                    name: 'Track order',
                    onTap: () {
                      Get.toNamed('/order-track');
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                width: 250,
                child: CommonOutlineButton(
                  name: 'Continue Shopping',
                  onTap: () {
                    Get.toNamed('/home');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
