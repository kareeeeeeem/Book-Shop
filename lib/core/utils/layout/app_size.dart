import 'package:flutter/material.dart';

class SizeOfScreen {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getHeight(double pixle, BuildContext context) {
    double screenHight = SizeOfScreen.screenHeight(context);
    double x = screenHight / pixle;
    return screenHight / x;
  }

  static double getWidth(double pixle, BuildContext context) {
    double screenWidth = SizeOfScreen.screenWidth(context);
    double x = screenWidth / pixle;
    return screenWidth / x;
  }
}
