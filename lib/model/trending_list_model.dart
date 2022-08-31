import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_constants.dart';
import 'package:myfirstflutter/_shared/app_images.dart';

class TrendingListModel {
  var title = "";
  var image = "";
  var color = AppColors.dropShadow;

  TrendingListModel();

  TrendingListModel.init(this.title, this.image,this.color);

  List<TrendingListModel> getTrendingItems() {
    List<TrendingListModel> items = [];
    items.add(TrendingListModel.init(AppConstants.hotOffers, AppImages.hotOffer,AppColors.hotOfferCardBg));
    items.add(TrendingListModel.init(AppConstants.nearByOffers, AppImages.nearBy,AppColors.nearByCardBg));
    items.add(TrendingListModel.init(AppConstants.newArrivals, AppImages.newArrival,AppColors.newArrivalCardBg));
    items.add(TrendingListModel.init(AppConstants.mostRedeem, AppImages.mostRedeem,AppColors.mostRedeemCardBg));
    return items;
  }




}