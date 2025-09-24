import 'package:flutter/widgets.dart';
import 'package:fruit_hub/helper/app_constant.dart';
import 'package:fruit_hub/model/status_enum.dart';

class MessageCardWidget extends StatelessWidget {
  final Status status;
  const MessageCardWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColor.statusRejectColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "We are sorry! Your order was rejected due to some condition.",
          style: TextStyle(
            fontSize: FontTheme.textSizeSmall,
            color: MyColor.whiteTextColor,
          ),
        ),
      ),
    );
  }
}
