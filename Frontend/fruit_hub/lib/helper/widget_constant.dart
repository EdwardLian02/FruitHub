import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

String statusConverter(String status) {
  switch (status) {
    case 'P':
      return 'Pending';
    case 'C':
      return 'Confirm';
    case 'R':
      return 'Reject';
    case 'BD':
      return 'Being Delivered';
    case 'D':
      return 'Delivered';
    default:
      return 'No status';
  }
}

Color convertStatusColor(String status) {
  switch (status) {
    case 'P':
      return MyColor.statusPendingColor;
    case 'C':
      return MyColor.statusConfirmColor;
    case 'R':
      return MyColor.statusRejectColor;
    case 'BD':
      return MyColor.statusBeingDelivered;
    case 'D':
      return MyColor.statusDeliveredColor;
    default:
      return MyColor.statusDefaultColor;
  }
}
