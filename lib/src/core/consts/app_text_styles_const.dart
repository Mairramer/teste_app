import 'package:flutter/material.dart';
import 'app_colors_const.dart';

class AppTextStylesConst {
  static final homeOptions = TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColorsConst.textColor);
  static final balanceText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColorsConst.white,
  );
  static final balance = TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColorsConst.white);
  static final balanceValue = TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColorsConst.white);
}
