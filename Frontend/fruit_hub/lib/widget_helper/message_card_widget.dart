import 'package:flutter/widgets.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/helper/widget_constant.dart';
import 'package:fruit_hub/model/status_enum.dart';
import 'package:fruit_hub/widget_helper/status_badge.dart';

class MessageCardWidget extends StatelessWidget {
  final Status status;
  const MessageCardWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: convertStatusColor(status)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          statusMessage(status) ?? "",
          style: TextStyle(
            fontSize: FontTheme.textSizeSmall,
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
    );
  }
}

String? statusMessage(Status status) {
  switch (status) {
    case Status.pending:
      return "We are reviewing your order. Please wait for the admin to confirm";
    case Status.reject:
      return "We are sorry! Your order was rejected due to some condition.";
    case Status.confirm:
      return "Order Confirmed";
    case Status.prepared:
      return "Order is Being Prepared";
    case Status.beingDeliver:
      return "Order is being delivered";
    case Status.delivered:
      return "Order has already delivered";
    default:
      return null;
  }
}
