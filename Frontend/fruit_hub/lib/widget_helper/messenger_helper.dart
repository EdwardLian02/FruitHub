import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class MessengerHelper {
  static showErrorToasteMessage(String message) => Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );

  static showGreenCheckToast(context) => showToastWidget(
        Opacity(
          opacity: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.successGreen,
              shape: BoxShape.circle,
            ),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                )),
          ),
        ),
        context: context,
        //animation
        animation: StyledToastAnimation.slideFromBottom,
        reverseAnimation: StyledToastAnimation.slideToBottom,
        //Position
        position: StyledToastPosition.center,
        //Duration
        duration: const Duration(seconds: 2),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn,
      );
}
