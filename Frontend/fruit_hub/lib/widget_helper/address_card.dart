import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final void Function()? onTap;
  const AddressCard({super.key, required this.address, this.onTap});

  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  "assets/images/icon/location_icon.png",
                  width: 25,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    address.name,
                    style: TextStyle(
                      fontSize: FontTheme.textSizeLarge,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Image.asset(
                      "assets/images/icon/eye-icon.png",
                      width: 22,
                    ),
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
