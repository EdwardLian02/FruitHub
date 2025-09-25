import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColor {
  static const Color primaryColor = Color(0xFFFFA451);
  static const Color lowOrangeColor = Color(0xFFFFF2E7);

  static const Color lowGreyColor = Color(0xFFF3F1F1);
  static const Color darkenGreyColor = Color(0xFFC2BDBD);
  static const Color extraDarkenGreyColor = Color(0xFF5D577E);

  static const Color textFieldFillColor = Color.fromARGB(223, 229, 226, 226);

  static const Color primaryTextColor = Colors.black;
  static const Color secondaryTextColor = Color(0xFFFFA451);
  static const Color whiteTextColor = Colors.white;

  static const Color successGreen = Color(0xFF4CD964);
  static const Color lowGreen = Color(0xFFE0FFE5);

  static const Color pinkBackgroundColor = Color(0xFFFEF0F0);
  static const Color blueBackgroundColor = Color(0xFFF1EFF6);
  static const Color yelloBackgroundColor = Color(0xFFFFFAEB);

  //Status Color
  static const Color statusConfirmColor = Color(0xFF3865a3);
  static const Color statusPendingColor = Color(0xFFffcc00);
  static const Color statusRejectColor = Color(0xFFe03b24);
  static const Color statusPreparedColor = Color(0xFFFFA451);
  static const Color statusBeingDelivered = Color(0xFF78923D);
  static const Color statusDeliveredColor = Color(0xFF64a338);
  static const Color statusDefaultColor = Colors.grey;
}

class FontTheme {
  //font family
  static const fontTheme = GoogleFonts.roboto;

  //Font size
  static const double textSizeExtraXLLarge = 40;
  static const double textSizeExtraXLarge = 30;

  static const double textSizeExtraLarge = 24;
  static const double textSizeLarge = 20;
  static const double textSizeNormal = 16;
  static const double textSizeSmall = 14;
}

class BaseUrl {
  static const String baseUrl = "http://127.0.0.1:8000/";
}
