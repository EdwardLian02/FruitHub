import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/address_controller.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/address_model.dart';
import 'package:fruit_hub/widget_helper/address_card.dart';
import 'package:fruit_hub/widget_helper/common_button.dart';
import 'package:fruit_hub/widget_helper/common_outline_button.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';
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
              onTap: () {},
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () =>
                        _buildAddNewAddressPopUp(context, addressController),
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
                  )),
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

void _buildAddNewAddressPopUp(context, AddressController addressController) {
  final formkey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icon/location_icon.png",
            width: 20,
          ),
          SizedBox(width: 10),
          Text(
            "Add new Address",
            style: TextStyle(
              fontSize: FontTheme.textSizeLarge,
            ),
          ),
        ],
      ),
      content: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonTextfield(
                controller: addressController.addressNameController,
                hintText: "Address name",
                validator: (value) {
                  if (value == null || value == "") {
                    return "*This field is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              CommonTextfield(
                controller: addressController.addressDetailController,
                hintText: "Address Detail",
                maxLines: 3,
                validator: (value) {
                  if (value == null || value == "") {
                    return "*This field is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              CommonTextfield(
                controller: addressController.phoneController,
                hintText: "+959",
                validator: (value) {
                  if (value == null || value == "") {
                    return "*This field is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CommonOutlineButton(
                    onTap: () => Get.back(),
                    name: "Cancel",
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CommonButton(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          final address = {
                            "name":
                                addressController.addressNameController.text,
                            "address":
                                addressController.addressDetailController.text,
                            "phone": addressController.phoneController.text,
                            "isCurrentAddress": false,
                          };
                          await addressController.createNewAddress(address);
                        }
                      },
                      name: "Save",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
