import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        color: MyColor.whiteTextColor,
        elevation: 0,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/breakfast-quinoa-and-red-fruit-salad.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Honey Lime Combo',
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '10,000MMK',
                        style: TextStyle(
                          fontSize: FontTheme.textSizeSmall,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: MyColor.lowOrangeColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.add,
                            color: MyColor.primaryColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Image.asset(
                'assets/images/icon/heart_outline.png',
                color: MyColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
