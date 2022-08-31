import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_constants.dart';
import 'package:myfirstflutter/_shared/app_images.dart';

class FoodListModel {
  var title = "";
  var image = "";
  var color = AppColors.dropShadow;

  FoodListModel();

  FoodListModel.init(this.title, this.image,this.color);

  List<FoodListModel> getTrendingItems() {
    List<FoodListModel> items = [];
    items.add(FoodListModel.init(AppConstants.fruits, AppImages.fruits,AppColors.fruitCardBg));
    items.add(FoodListModel.init(AppConstants.vegetables, AppImages.vegetables,AppColors.vegetableCardBg));
    items.add(FoodListModel.init(AppConstants.bakery, AppImages.bakery,AppColors.meatCardBg));
    items.add(FoodListModel.init(AppConstants.meat, AppImages.meat,AppColors.bakeryCardBg));
   return items;
  }




}