import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  const MenuCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        color: MyColor.whiteTextColor,
        elevation: 0.8,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [
                  Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: FontTheme.textSizeNormal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: price,
                            style: TextStyle(
                              fontSize: FontTheme.textSizeSmall,
                              color: MyColor.primaryColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' MMK',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
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
