import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/address_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/address_model.dart';
import 'package:fruit_hub/widget_helper/address_card.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
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
            GestureDetector(
              onTap: () {
                print("Hi");
              },
              child: Row(
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
            ),

            SizedBox(height: 20),

            //Address list section
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: addressController.addressList.length,
                  itemBuilder: (context, index) {
                    final addressObj = AddressModel.fromJson(
                        addressController.addressList[index]);
                    return AddressCard(
                      address: addressObj,
                      onSelect: (String idValue) {
                        addressController.selectAddress(idValue);
                      },
                    );
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
