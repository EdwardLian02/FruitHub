import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      "Home",
                      style: TextStyle(
                        fontSize: FontTheme.textSizeLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Radio(
                  activeColor: MyColor.primaryColor,
                  value: false,
                  groupValue: "location_radio",
                  onChanged: (value) {},
                )
              ],
            ),
            SizedBox(height: 5),
            Text("No.123, Sanchaung, Yangon",
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                )),
            SizedBox(height: 5),
            Text("+959344323243",
                style: TextStyle(
                  fontSize: FontTheme.textSizeNormal,
                )),
          ],
        ),
      ),
    );
  }
}
