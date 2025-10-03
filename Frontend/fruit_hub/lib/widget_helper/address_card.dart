import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/address_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/address_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final Function(String) onSelect;

  const AddressCard({super.key, required this.address, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.find<AddressController>();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            style: BorderStyle.solid,
            color: MyColor.darkenGreyColor,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/icon/location_icon.png",
                      width: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      address.name,
                      style: TextStyle(
                        fontSize: FontTheme.textSizeLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Radio(
                    activeColor: MyColor.primaryColor,
                    value: address.id,
                    groupValue: addressController.currentAddressId.value,
                    onChanged: (value) {
                      if (value != null) {
                        onSelect(value);
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(address.address,
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                )),
            SizedBox(height: 5),
            Text(address.phone,
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                )),
          ],
        ),
      ),
    );
  }
}
