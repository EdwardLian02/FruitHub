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
                    onTap: () {
                      addressController.resetTextController();
                      _buildAddressFormPopUp(
                        context: context,
                        addressController: addressController,
                        formType: FormType.add,
                      );
                    },
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
                    return GestureDetector(
                      onLongPressStart: (detail) => _buildPopUpMenu(
                        context: context,
                        tapPosition: detail.globalPosition,
                        addressController: addressController,
                        addressObj: addressObj,
                        index: index,
                      ),
                      child: AddressCard(
                        address: addressObj,
                        onSelect: (String idValue) {
                          addressController.selectAddress(idValue);
                        },
                      ),
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

//Enum for type selection
enum FormType {
  add,
  update,
}

void _buildAddressFormPopUp({
  required context,
  required AddressController addressController,
  required FormType formType,
  index,
  addressId,
}) {
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
            formType == FormType.add ? "Add new Address" : "Update Address",
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
              Obx(() => AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.elasticInOut,
                    child: addressController.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : addressController.isError.isTrue
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          addressController.isError(false);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      addressController.errorMessage.value,
                                      style: TextStyle(
                                        color: MyColor.whiteTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                  )),
              SizedBox(
                height: 10,
              ),
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
                            "id": addressId,
                            "name":
                                addressController.addressNameController.text,
                            "address":
                                addressController.addressDetailController.text,
                            "phone": addressController.phoneController.text,
                            "isCurrentAddress": false,
                          };
                          if (formType == FormType.add) {
                            await addressController.createNewAddress(address);
                          } else {
                            await addressController.updateAddress(
                                address, index);
                          }
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

//Menu : Update , Delete
void _buildPopUpMenu({
  required context,
  required tapPosition,
  required AddressController addressController,
  required AddressModel addressObj,
  required index,
}) {
  //Get the tap position

  showMenu(
    position: RelativeRect.fromLTRB(
      tapPosition.dx,
      tapPosition.dy,
      tapPosition.dx,
      tapPosition.dy,
    ),
    color: Colors.white,
    elevation: 1.0,
    context: context,
    items: [
      PopupMenuItem(
        onTap: () {
          addressController.addressNameController.text = addressObj.name;
          addressController.addressDetailController.text = addressObj.address;
          addressController.phoneController.text = addressObj.phone;

          _buildAddressFormPopUp(
            context: context,
            formType: FormType.update,
            addressController: addressController,
            index: index,
            addressId: addressObj.id,
          );
        },
        value: 'edit',
        child: Text('Edit'),
      ),
      PopupMenuItem(
        onTap: () async =>
            await addressController.deleteAddress(addressObj.id, index),
        value: 'delete',
        child: Text('Delete'),
      ),
    ],
  );
}
