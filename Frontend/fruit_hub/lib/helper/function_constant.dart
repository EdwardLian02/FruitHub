import 'dart:ffi';
import 'package:intl/intl.dart';

String currencyFormatHelper(double moneyNumber) {
  final currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: 'MMK',
    decimalDigits: 0,
  );
  return currencyFormat.format(moneyNumber);
}

DateTime stringToDateTimeFormatConverter(String datetime) {
  return DateTime.parse(datetime);
}
