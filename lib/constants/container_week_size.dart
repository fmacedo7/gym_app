import 'package:flutter/material.dart';
import 'package:gym_app/theme/colors.dart';

class WeekContainerConstants {
  static double containerWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth / 6;
  }

  static double containerHeight(BuildContext context) {
    return containerWidth(context) + 10;
  }

  static const Color borderColor = primaryBlack;
  static const double borderWidth = 2.0;
  static const Color currentColorDay = primaryBlue;
}
