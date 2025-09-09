import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MenuCard extends StatelessWidget {
  final MenuModel menuModel;
  const MenuCard({super.key, required this.menuModel});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 180,
        child: Card(
          color: MyColor.whiteTextColor,
          elevation: 0.8,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      children: [
                        Image.network(
                          menuModel.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Text(
                          menuModel.name,
                          style: TextStyle(
                            fontSize: FontTheme.textSizeNormal,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Row(
                          // direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: menuModel.price.toString(),
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
                                  menuModel.isInBasket.value!
                                      ? Icons.check
                                      : Icons.add,
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
                ],
              ),

              //Heart-icon
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
      ),
    );
  }
}


  //Heart-icon
              // Positioned(
              //   right: 10,
              //   top: 10,
              //   child: Image.asset(
              //     'assets/images/icon/heart_outline.png',
              //     color: MyColor.primaryColor,
              //   ),
              // ),