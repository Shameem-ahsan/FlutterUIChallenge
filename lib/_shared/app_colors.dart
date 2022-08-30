import 'package:flutter/material.dart';

class AppColors {
  static final Color splashBackground = getColorFromHex("#EDF1F9");
  static final Color splashBackgroundBottom = getColorFromHex("#E9EBF1");

  static final Color appBarColor = getColorFromHex("#273C71");

  static final Color white = getColorFromHex("#FFFFF");
  static final Color black = getColorFromHex("#00000");

  static final Color dropShadow = getColorFromHex("#77777729");
  static final Color categoryCircleColor = getColorFromHex("#EDF1F9");

  static final Color mcDonaldCardBg = getColorFromHex("#CDF7E9");
  static final Color kfcCardBg = getColorFromHex("#FFF6F6");
  static final Color nikeCardBg = getColorFromHex("#EBF3FF");
  static final Color carrerFourCardBg = getColorFromHex("#F0FFFE");
  static final Color expoCardBg = getColorFromHex("#FDFFE4");
  static final Color appleCardBg = getColorFromHex("#F6EFFF");

  
  //MARK: Util function to convert hex string to color
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}

