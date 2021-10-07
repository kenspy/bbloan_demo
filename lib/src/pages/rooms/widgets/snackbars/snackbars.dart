import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
showSnackbar(title, middleText, icon) {
  Get.snackbar(
    title,
    middleText,
    maxWidth: 300.0,
    icon: Icon(icon),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.grey.shade800,
    colorText: Colors.white,
    borderRadius: 4,
    margin: EdgeInsets.all(15),
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
