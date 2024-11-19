

import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

String getFormattedDateToday() {
  return DateFormat('yyyy/MM/dd').format(DateTime.now());
}

String getFormattedDateYesterdayWithHour(String time) {
  return DateFormat(' HH:mm - yyyy/MM/dd ').format(DateTime.parse(time));
}

List<TextInputFormatter> allowSingleDecimalInput() {
  return [
    // Allows only digits and a decimal point
    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),

    // Prevents multiple decimal points
    TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.contains('.') && newValue.text.split('.').length > 2) {
        return oldValue;
      }
      return newValue;
    })
  ];
}
