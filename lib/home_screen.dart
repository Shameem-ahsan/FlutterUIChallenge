import 'package:flutter/material.dart';
import 'package:myfirstflutter/_common_widgets/appBar.dart';
import 'package:myfirstflutter/_common_widgets/screen_presenter.dart';
import 'package:myfirstflutter/_common_widgets/text_styles.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_constants.dart';
import 'package:myfirstflutter/_shared/app_images.dart';
import 'package:myfirstflutter/model/category_list_model.dart';
import 'package:myfirstflutter/model/food_list_model.dart';
import 'package:myfirstflutter/model/offers_list_model.dart';
import 'package:myfirstflutter/model/trending_list_model.dart';
import 'package:myfirstflutter/offer_details_screen.dart';
import 'package:myfirstflutter/splash_screen.dart';

const itemSize = 150.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryListModel> categoryItems = [];
  List<OfferListModel> offerItems = [];
  final scrollController = ScrollController();
  TrendingListModel trendingListModel = TrendingListModel();
  FoodListModel foodListModel = FoodListModel();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    addCategoryItems();
    addOffersListValues();
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sliderView(),
            titleView(AppConstants.discover),
            categoryListView(),
            const SizedBox(height: 10),
            hotDealsView(),
            titleView(AppConstants.myCoupons),
            offerListView(context),
            const SizedBox(
              height: 10,
            ),
            foodListView(),
          ],
        ),
      ),
    );
  }

  Widget sliderView() {
    return Container(
      height: AppConstants.bannerHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.pizza),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.pizzaHut,
            width: 40,
            height: 40,
          ),
          Text(AppConstants.getOffOnFirstOrder,
              style: TextStyles.bannerTextStyle),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ))),
            child: const Text(AppConstants.getNow),
          )
        ],
      ),
    );
  }

  Widget titleView(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyles.titleStyle),
          Row(
            children: const [
              Text(AppConstants.viewAll,
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 14,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget categoryListView() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: categoryItems.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100,
              height: 100,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: AppColors.categoryCircleColor,
                        shape: BoxShape.circle),
                    child: Image.asset(
                      categoryItems[index].image,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    categoryItems[index].title,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget hotDealsView() {
    const columnCount = 2;
    final width = MediaQuery.of(context).size.width / columnCount;
    const height = 100;
    return Container(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      color: AppColors.categoryCircleColor,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: width / height,
            crossAxisCount: columnCount,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: trendingListModel.getTrendingItems().length,
          itemBuilder: (BuildContext ctx, index) {
            final items = trendingListModel.getTrendingItems()[index];
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: items.color,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            items.image,
                            width: 24,
                            height: 24,
                          ),
                          Text(items.title,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Opacity(
                        opacity: .3,
                        child: Image.asset(
                          items.image,
                        ),
                      ),
                    )
                  ],
                ));
          }),
    );
  }

  Widget offerListView(BuildContext buildContext) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        padding:
            const EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10.0),
        controller: scrollController,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: offerItems.length,
        itemBuilder: (context, index) {
          const heightFactor = 0.8;
          final items = offerItems[index];
          final itemPositionOffset = index * itemSize * heightFactor;
          final difference = scrollController.offset - itemPositionOffset;
          final percent = 1.0 - (difference / (itemSize * heightFactor));
          double opacity = percent;
          double scale = percent;
          if (opacity > 1.0) opacity = 1.0;
          if (opacity < 0.0) opacity = 0.0;
          if (percent > 1.0) scale = 1.0;

          return Align(
            heightFactor: heightFactor,
            child: Opacity(
              opacity: opacity,
              child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()..scale(scale, scale),
                  child: InkWell(
                    onTap: () {
                      //ScreenPresenter.present(OfferDetailsScreen(offerListModel: items), buildContext);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetailsScreen(offerListModel: items)));

                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        gradient: LinearGradient(
                          colors: [
                            offerItems[index].backgroundColor,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.dropShadow.withOpacity(.160),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, -10) // changes position of shadow
                              ),
                        ],
                      ),
                      height: itemSize,
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        items.leadingImage,
                                        width: 40,
                                        height: 40,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(items.title,
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.black)),
                                    ],
                                  ),
                                  Text(items.percentage,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      items.trailingImage,
                                      width: 120,
                                      height: 120,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget foodListView() {
    const columnCount = 2;
    final width = MediaQuery.of(context).size.width / columnCount;
    const height = 100;
    return Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        color: AppColors.categoryCircleColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppConstants.freshFoods,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Text(AppConstants.viewAll,
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.black,
                        size: 14,
                      ),
                    ],
                  )
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: width / height,
                  crossAxisCount: columnCount,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: foodListModel.getTrendingItems().length,
                itemBuilder: (BuildContext ctx, index) {
                  final items = foodListModel.getTrendingItems()[index];
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: items.color,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              items.image,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(items.title,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ],
                      ));
                }),
          ],
        ));
  }

  void addCategoryItems() {
    categoryItems.add(CategoryListModel("Restaurants", AppImages.restaurant));
    categoryItems.add(CategoryListModel("Travel & Tourism", AppImages.travel));
    categoryItems.add(CategoryListModel("Healthy", AppImages.health));
    categoryItems.add(CategoryListModel("Vehicles", AppImages.vehicle));
    categoryItems.add(CategoryListModel("Restaurants", AppImages.restaurant));
    categoryItems.add(CategoryListModel("Travel Tourisam", AppImages.travel));
    categoryItems.add(CategoryListModel("Healthy", AppImages.health));
    categoryItems.add(CategoryListModel("Vehicles", AppImages.vehicle));
  }

  void addOffersListValues() {
    offerItems.add(OfferListModel(1,
        "McDonald weekend offer",
        "50%",
        AppImages.mcDonaldLogo,
        AppImages.mcDonaldFries,
        AppColors.mcDonaldCardBg));
    offerItems.add(OfferListModel(2,"Nike flash sale", "40%", AppImages.nikeLogo,
        AppImages.nikeShoe, AppColors.nikeCardBg));
    offerItems.add(OfferListModel(3,"KFC birthday offer", "20%",
        AppImages.kfcLogo, AppImages.kfcChicken, AppColors.kfcCardBg));
    offerItems.add(OfferListModel(4,
        "Carrerfour Day",
        "30%",
        AppImages.careerFourLogo,
        AppImages.fridge,
        AppColors.carrerFourCardBg));
    offerItems.add(OfferListModel(5,"Expo 2020 dubai UAE", "70%",
        AppImages.expoLogo, AppImages.expoDubai, AppColors.expoCardBg));
    offerItems.add(OfferListModel(6,"Apple Offer", "25%", AppImages.appleLogo,
        AppImages.iphoneBundle, AppColors.appleCardBg));

  }
}
