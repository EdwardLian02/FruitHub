import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_hub/controller/basket_controller.dart';
import 'package:fruit_hub/controller/favorite_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/widget_helper/circle_icon_button.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/messenger_helper.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final MenuModel menuModel;

  const DetailScreen({super.key, required this.menuModel});

  @override
  Widget build(BuildContext context) {
    final basketController = Get.find<BasketController>();
    final favoriteController = Get.put(FavoriteController());
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
              child: Obx(
                () => CircleIconButton(
                  width: 70,
                  height: 70,
                  haveBorder: false,
                  icon: menuModel.isFavorite.value
                      ? Image.asset(
                          'assets/images/icon/heart_fill.png',
                          width: 10.0,
                          height: 10.0,
                          color: Colors.red,
                        )
                      : Image.asset(
                          'assets/images/icon/bigger_heart_icon.png',
                          width: 10.0,
                          height: 10.0,
                        ),
                  buttonColor: MyColor.lowOrangeColor,
                  onTap: () async {
                    print("hi");
                    if (!menuModel.isFavorite.value) {
                      await favoriteController.createFavorite(menuModel);
                    } else {
                      await favoriteController.deleteFavorite(menuModel);
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => menuModel.isInBasket.value
                    ? CommonButton(
                        name: basketController.checkIfTheCurrentQtyIsChanged()
                            ? "Save"
                            : "Already in basket",
                        onTap: () {
                          print(
                              basketController.checkIfTheCurrentQtyIsChanged());
                          if (basketController
                              .checkIfTheCurrentQtyIsChanged()) {
                            //Update the basket again.
                            basketController.updateBasketQty(menuModel.id);
                            MessengerHelper.showGreenCheckToast(context);
                          } else {
                            Get.toNamed('/basket');
                          }
                        },
                      )
                    : CommonButton(
                        name: 'Add to Basket',
                        onTap: () {
                          final qty = basketController.menuBasketCount.value;
                          basketController.addToBasket({
                            'menu': menuModel,
                            'qty': qty,
                          });

                          MessengerHelper.showGreenCheckToast(context);
                        },
                      ),
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
                    child: Image.network(menuModel.imageUrl),
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
                    menuModel.name,
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
                      Obx(
                        () => Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                basketController.decreaseCounter();
                              },
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                basketController.menuBasketCount.toString(),
                                style: TextStyle(
                                  fontSize: FontTheme.textSizeLarge,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                basketController.increaseCounter();
                              },
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
                      ),
                      Text(
                        '${menuModel.price} MMk',
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
                    menuModel.description,
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
