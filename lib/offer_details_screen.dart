import 'package:flutter/material.dart';
import 'package:myfirstflutter/_common_widgets/text_styles.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_constants.dart';
import 'package:myfirstflutter/_shared/app_images.dart';
import 'package:myfirstflutter/model/offers_list_model.dart';

class OfferDetailsScreen extends StatefulWidget {
  final OfferListModel offerListModel;
  const OfferDetailsScreen({Key? key,required this.offerListModel}) : super(key: key);

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.offerListModel.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              navigationIconsView(context),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                widget.offerListModel.leadingImage,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleView(),
                  offerValidityView(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(AppConstants.shoeDescription,
                  style: TextStyles.descriptionStyle),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                widget.offerListModel.trailingImage,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: roundedActionButton(),
    );
  }

  Widget navigationIconsView(BuildContext buildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap:()=>{ Navigator.pop(buildContext)},
          child: Image.asset(
            AppImages.back,
            width: 22,
            height: 16,
          ),
        ),
        Image.asset(
          AppImages.share,
          width: 20,
          height: 17,
        )
      ],
    );
  }

  Widget offerValidityView() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: AppColors.blue),
            ),
            child: Column(
              children: [
                Text("End date",
                    style: TextStyle(fontSize: 12, color: AppColors.blue)),
                Text("20",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue)),
                Text("MAY",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue)),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        Text("3 days left",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.orange)),
      ],
    );
  }

  Widget titleView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: widget.offerListModel.percentage, style: TextStyles.percentageStyle),
              TextSpan(
                text: '%',
                style: TextStyle(
                    fontSize: 21,
                    color: AppColors.dropShadow,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Text(widget.offerListModel.title, style: TextStyles.titleStyle),
      ],
    );
  }

  Widget roundedActionButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20.0),
      child: SizedBox(
        height: 50,
        child: MaterialButton(
          minWidth: 50,
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.only(left: 8, right: 8),
          onPressed: () {},
          enableFeedback: true,
          color: AppColors.whiteColor,
          child: Center(
            child: Text("More details",
                style: TextStyle(fontSize: 16, color: AppColors.blue)),
          ),
        ),
      ),
    );
  }
}
