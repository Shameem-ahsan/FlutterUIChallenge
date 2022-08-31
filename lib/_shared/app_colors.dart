import 'package:flutter/material.dart';

class AppColors {
  static final Color splashBackground = getColorFromHex("#EDF1F9");
  static final Color splashBackgroundBottom = getColorFromHex("#E9EBF1");

  static final Color appBarColor = getColorFromHex("#273C71");

  static final Color whiteColor = getColorFromHex("#ffffff");
  static final Color blackColor = getColorFromHex("#000000");

  static final Color dropShadow = getColorFromHex("#777777");
  static final Color categoryCircleColor = getColorFromHex("#EDF1F9");

  static final Color hotOfferCardBg = getColorFromHex("#E63C2E");
  static final Color nearByCardBg = getColorFromHex("#273C71");
  static final Color mostRedeemCardBg = getColorFromHex("#ECA941");
  static final Color newArrivalCardBg = getColorFromHex("#105F98");

  static final Color mcDonaldCardBg = getColorFromHex("#CDF7E9");
  static final Color kfcCardBg = getColorFromHex("#FFF6F6");
  static final Color nikeCardBg = getColorFromHex("#EBF3FF");
  static final Color carrerFourCardBg = getColorFromHex("#F0FFFE");
  static final Color expoCardBg = getColorFromHex("#FDFFE4");
  static final Color appleCardBg = getColorFromHex("#F6EFFF");

  static Color test= getColorFromHex("#E63C2E");

  static final Color fruitCardBg = getColorFromHex("#441197");
  static final Color vegetableCardBg = getColorFromHex("#3B9927");
  static final Color bakeryCardBg = getColorFromHex("#B25827");
  static final Color meatCardBg= getColorFromHex("#FED504");


  //offer details
  static final Color blue = getColorFromHex("#273C71");
  static final Color descriptionColor = getColorFromHex("#272B31");
  static final Color orange = getColorFromHex("#E63C2E");

  
  //MARK: Util function to convert hex string to color
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}

