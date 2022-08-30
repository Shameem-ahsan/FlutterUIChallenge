import 'package:myfirstflutter/_shared/app_colors.dart';

class OfferListModel {
  OfferListModel(
      this.title, this.percentage, this.leadingImage, this.trailingImage,this.backgroundColor);

  var title = "";
  var percentage = "";
  var leadingImage = "";
  var trailingImage = "";
  var backgroundColor = AppColors.appleCardBg;
}
