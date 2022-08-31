
import 'package:flutter/material.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_constants.dart';
import 'package:myfirstflutter/_shared/app_fonts.dart';

class TextStyles {

  static get bannerTextStyle =>  TextStyle(fontSize: 22, color: AppColors.whiteColor,fontFamily: AppFonts.alMaraiBold);

  static get titleStyle =>  TextStyle(fontSize: 14, color: AppColors.blackColor, fontWeight: FontWeight.bold);
  static get viewAllStyle =>  TextStyle(fontSize: 14, color: AppColors.blackColor);

  static get descriptionStyle =>  TextStyle(fontSize: 14, color: AppColors.descriptionColor);


  static get categoryNameStyle =>  TextStyle(fontSize: 12, color: AppColors.blackColor);


  static get percentageStyle =>  TextStyle(fontSize:48, color: AppColors.blackColor, fontWeight: FontWeight.bold);




}