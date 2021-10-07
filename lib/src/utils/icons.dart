import 'package:flutter/material.dart';

Icon getIcons(title, color, size) {
  //
  switch (title) {
    case 'Loan App':
      return Icon(Icons.credit_score, color: color, size: size);
    case 'User Rooms':
      return Icon(Icons.groups, color: color, size: size);
    case 'college':
      return Icon(Icons.school, color: color, size: size);
    case 'highschool':
      return Icon(Icons.corporate_fare, color: color, size: size);
    case 'widgets':
      return Icon(Icons.widgets_outlined, color: color, size: size);
    default:
      return Icon(Icons.star, color: color, size: size);
  }
}
