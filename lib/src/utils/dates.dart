import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//
selectDob(context) async {
  DateTime? dob = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1940),
    lastDate: DateTime(2010),
  );

  return dob;
}

//
getAge(date) {
  var dob = DateFormat('MM/dd/yyyy').parse(date);
  final today = DateTime.now();

  int years = today.year - dob.year;
  return years;
}
