import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/widget_helper/address_card.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: MyColor.primaryColor,
        foregroundColor: MyColor.whiteTextColor,
        title: Text(
          "Address",
          style: TextStyle(color: MyColor.whiteTextColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            //Add new address button section
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        color: MyColor.lowOrangeColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: MyColor.primaryColor,
                        iconColor: MyColor.primaryColor,
                        leading: Icon(
                          Icons.add,
                        ),
                        title: Text("Add New Address"),
                      )),
                ))
              ],
            ),

            SizedBox(height: 20),

            //Address list section
            AddressCard(),
          ],
        ),
      ),
    );
  }
}
