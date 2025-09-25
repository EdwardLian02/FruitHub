import 'package:flutter/material.dart';
import 'package:fruit_hub/model/order_model.dart';
import 'package:fruit_hub/model/status_enum.dart';
import 'package:fruit_hub/widget_helper/order_tracking_tile.dart';

class OrderTrackingWidgetSection extends StatelessWidget {
  final OrderModel orderModel;
  const OrderTrackingWidgetSection({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderTrackingTile(
          isFirst: true,
          isPast: calculateIsPast(Status.confirm, orderModel.status),
          title: "Order Taken",
          description:
              "Your order has been taken and confirmed by the admin. We will prepared your order soon",
          iconUrl: "assets/images/icon/take-order.png",
        ),
        OrderTrackingTile(
          isPast: calculateIsPast(Status.prepared, orderModel.status),
          title: "Order is Being Prepared",
          description: "We are preparing your order. Will be on your way soon!",
          iconUrl: "assets/images/icon/prepared-order.png",
        ),
        OrderTrackingTile(
          isPast: calculateIsPast(Status.beingDeliver, orderModel.status),
          title: "Delivering",
          description: "Order is on it's way. Get ready for your order",
          iconUrl: 'assets/images/icon/delivery-man-riding-red-scooter.png',
        ),
        OrderTrackingTile(
          isLast: true,
          isPast: calculateIsPast(Status.delivered, orderModel.status),
          title: "Order Received",
          description:
              "Thank you for your purchased. I hope we will come across very often",
        ),
      ],
    );
  }

  bool calculateIsPast(Status currentTimelineStatus, Status orderStatus) {
    Map<Status, int> statusOrder = {
      Status.pending: 1,
      Status.reject: 1,
      Status.confirm: 2,
      Status.prepared: 3,
      Status.beingDeliver: 4,
      Status.delivered: 5
    };

    return statusOrder[orderStatus]! >= statusOrder[currentTimelineStatus]!;
  }
}
