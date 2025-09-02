import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/splash2_logo_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final splash2LogoController = Get.put(Splash2LogoController());
    return Scaffold(
      body: Column(
        children: [
          //Visual section
          Flexible(
            flex: 1,
            child: Container(
              color: MyColor.primaryColor,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: splash2LogoController.slideAnimation,
                    child: SizedBox(
                      width: 400,
                      child: Image.asset('assets/images/splash2.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Info section
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Get The Freshest Fruit Salad Combo',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeLarge,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                      color: MyColor.extraDarkenGreyColor,
                      height: 1.8,
                    ),
                  ),
                  //

                  SizedBox(height: 100),
                  CommonButton(
                    name: 'Let\'s Continue',
                    onTap: () {
                      Get.offNamed('/login');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
