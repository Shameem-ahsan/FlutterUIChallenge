import 'package:flutter/material.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';

class OfferListModel {
  OfferListModel(this.id, this.title, this.percentage, this.leadingImage,
      this.trailingImage, this.backgroundColor);

  int id;
  String title = "";
  String percentage = "";
  String leadingImage = "";
  String trailingImage = "";
  Color backgroundColor = AppColors.appleCardBg;
}
