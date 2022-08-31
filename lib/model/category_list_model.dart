import 'package:myfirstflutter/_shared/app_images.dart';

class CategoryListModel {
  var title = "";
  var image = "";

  CategoryListModel.init();

  CategoryListModel(this.title, this.image);

  List<CategoryListModel> getCategoryItems() {
    List<CategoryListModel> categoryItems = [];
    categoryItems.add(CategoryListModel("Restaurants", AppImages.restaurant));
    categoryItems.add(CategoryListModel("Travel Tourisam", AppImages.travel));
    categoryItems.add(CategoryListModel("Healthy", AppImages.health));
    categoryItems.add(CategoryListModel("Vehicles", AppImages.vehicle));
    categoryItems.add(CategoryListModel("Restaurants", AppImages.restaurant));
    categoryItems.add(CategoryListModel("Travel Tourisam", AppImages.travel));
    categoryItems.add(CategoryListModel("Healthy", AppImages.health));
    categoryItems.add(CategoryListModel("Vehicles", AppImages.vehicle));
    return categoryItems;
  }




}
