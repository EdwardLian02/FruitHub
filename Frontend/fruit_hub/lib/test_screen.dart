import 'package:flutter/material.dart';
import 'package:fruit_hub/model/menu_model.dart';
import 'package:fruit_hub/widget_helper/filter_items.dart';
import 'package:fruit_hub/widget_helper/menu_card.dart';
import 'package:popover/popover.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            childAspectRatio: 0.85,
            mainAxisSpacing: 10,
          ),
          children: [
            MenuCard(
              menuModel: MenuModel(
                  id: "002",
                  name: "Kyaw YGi MENU",
                  description: "Some shit",
                  price: 10.0,
                  imageUrl:
                      "http://127.0.0.1:8000/media/menu/breakfast-quinoa-and-red-fruit-salad_1mGlGum.png",
                  category: "Something",
                  isFavorite: true),
            ),
            MenuCard(
              menuModel: MenuModel(
                  id: "002",
                  name: "My My is not too bad menu",
                  description: "Some shit",
                  price: 10.0,
                  imageUrl:
                      "http://127.0.0.1:8000/media/menu/breakfast-quinoa-and-red-fruit-salad_1mGlGum.png",
                  category: "Something",
                  isFavorite: true),
            ),
          ],
        ));
  }
}
