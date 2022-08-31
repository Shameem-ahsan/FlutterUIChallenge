import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_images.dart';

class OfferListModel {
  OfferListModel(
      this.title, this.percentage, this.leadingImage, this.trailingImage,this.backgroundColor);

  var title = "";
  var percentage = "";
  var leadingImage = "";
  var trailingImage = "";
  var backgroundColor = AppColors.appleCardBg;


  List<OfferListModel> getOffersListValues() {
    List<OfferListModel> offerItems = [];
    offerItems.add(OfferListModel(
        "McDonald weekend offer",
        "50%",
        AppImages.mcDonaldLogo,
        AppImages.mcDonaldFries,
        AppColors.mcDonaldCardBg));
    offerItems.add(OfferListModel("Nike flash sale", "40%", AppImages.nikeLogo,
        AppImages.nikeShoe, AppColors.nikeCardBg));
    offerItems.add(OfferListModel("KFC birthday offer", "20%",
        AppImages.kfcLogo, AppImages.kfcChicken, AppColors.kfcCardBg));
    offerItems.add(OfferListModel(
        "Carrerfour Day",
        "30%",
        AppImages.careerFourLogo,
        AppImages.fridge,
        AppColors.carrerFourCardBg));
    offerItems.add(OfferListModel("Expo 2020 dubai UAE", "70%",
        AppImages.expoLogo, AppImages.expoDubai, AppColors.expoCardBg));
    offerItems.add(OfferListModel("Apple Offer", "25%", AppImages.appleLogo,
        AppImages.iphoneBundle, AppColors.appleCardBg));
    offerItems.add(OfferListModel(
        "McDonald weekend offer",
        "50%",
        AppImages.mcDonaldLogo,
        AppImages.mcDonaldFries,
        AppColors.mcDonaldCardBg));
    offerItems.add(OfferListModel("Nike flash sale", "40%", AppImages.nikeLogo,
        AppImages.nikeShoe, AppColors.nikeCardBg));
    offerItems.add(OfferListModel("KFC birthday offer", "20%",
        AppImages.kfcLogo, AppImages.kfcChicken, AppColors.kfcCardBg));
    offerItems.add(OfferListModel(
        "Carrerfour Day",
        "30%",
        AppImages.careerFourLogo,
        AppImages.fridge,
        AppColors.carrerFourCardBg));
    offerItems.add(OfferListModel("Expo 2020 dubai UAE", "70%",
        AppImages.expoLogo, AppImages.expoDubai, AppColors.expoCardBg));
    offerItems.add(OfferListModel("Apple Offer", "25%", AppImages.appleLogo,
        AppImages.iphoneBundle, AppColors.appleCardBg));
    return offerItems;
  }


}
