import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/circle_icon_button.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 30,
              ),
              child: CircleIconButton(
                width: 70,
                height: 70,
                haveBorder: false,
                icon: Image.asset(
                  'assets/images/icon/bigger_heart_icon.png',
                  width: 10.0,
                  height: 10.0,
                ),
                buttonColor: MyColor.lowOrangeColor,
              ),
            ),
            Expanded(
              child: CommonButton(
                name: 'Add to Basket',
                onTap: () {
                  Get.toNamed('/basket');
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Food Visual Section
            Stack(
              children: [
                Container(
                  color: MyColor.primaryColor,
                  width: double.maxFinite,
                  height: 250,
                ),
                Positioned(
                  child: Center(
                    child: Image.asset(
                      'assets/images/breakfast-quinoa-and-red-fruit-salad.png',
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -60,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            //Content section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name
                  Text(
                    'Quinoa Fruit Salad',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeExtraLarge,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //Counter
                  SizedBox(height: 20),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: FontTheme.textSizeLarge,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  style: BorderStyle.none,
                                ),
                                color: MyColor.lowOrangeColor,
                              ),
                              child: Icon(
                                Icons.add,
                                color: MyColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '10,000 MMk',
                        style: TextStyle(
                          fontSize: FontTheme.textSizeLarge,
                        ),
                      ),
                    ],
                  ),

                  //divider
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  //Description section
                  Text(
                    'One Pack Contains',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeLarge,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  //Conclusion section
                  //divider
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Text(
                    'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
