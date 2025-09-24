import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/status_enum.dart';

String statusConverter(Status status) {
  switch (status) {
    case Status.pending:
      return 'Pending';
    case Status.confirm:
      return 'Confirm';
    case Status.reject:
      return 'Reject';
    case Status.beingDeliver:
      return 'Being Delivered';
    case Status.delivered:
      return 'Delivered';
    default:
      return 'No status';
  }
}

Color convertStatusColor(Status status) {
  switch (status) {
    case Status.pending:
      return MyColor.statusPendingColor;
    case Status.confirm:
      return MyColor.statusConfirmColor;
    case Status.reject:
      return MyColor.statusRejectColor;
    case Status.beingDeliver:
      return MyColor.statusBeingDelivered;
    case Status.delivered:
      return MyColor.statusDeliveredColor;
    default:
      return MyColor.statusDefaultColor;
  }
}
