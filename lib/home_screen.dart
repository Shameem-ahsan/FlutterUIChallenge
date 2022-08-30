import 'package:flutter/material.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_images.dart';
import 'package:myfirstflutter/model/category_list_model.dart';
import 'package:myfirstflutter/model/offers_list_model.dart';
import 'package:myfirstflutter/_common_widgets/appBar.dart';

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
      appBar:CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            offerTitleView("Discover"),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: categoryListView(),
              ),
            ),
            offerTitleView("My Coupons"),
            separatorHeight(),
            offerListView(),
            separatorHeight()
          ],
        ),
      ),
    );
  }

  Widget separatorHeight(){
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
      ),
    );
  }

  Widget offerTitleView(String title) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(title,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Row(
              children: const [
                Text("View All",
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
    );
  }

  Widget offerListView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
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
                          color: AppColors.dropShadow.withOpacity(.3),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: Offset(0, -6), // changes position of shadow
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
                            Expanded(
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
                  )),
            ),
          );
        },
        childCount: offerItems.length,
      ),
    );
  }

  Widget categoryListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          return Container(
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
                SizedBox(
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
        });
  }

  void addCategoryItems() {
    categoryItems.add(CategoryListModel("Restaurants", AppImages.restaurant));
    categoryItems.add(CategoryListModel("Travel Tourisam", AppImages.travel));
    categoryItems.add(CategoryListModel("Healthy", AppImages.health));
    categoryItems.add(CategoryListModel("Vehicles", AppImages.vehicle));
    categoryItems.add(CategoryListModel("Restaurants", AppImages.restaurant));
    categoryItems.add(CategoryListModel("Travel Tourisam", AppImages.travel));
    categoryItems.add(CategoryListModel("Healthy", AppImages.health));
    categoryItems.add(CategoryListModel("Vehicles", AppImages.vehicle));
  }

  void addOffersListValues() {
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
  }



}
