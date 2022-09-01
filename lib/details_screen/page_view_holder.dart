import 'package:flutter/material.dart';
import 'package:myfirstflutter/details_screen/offer_details_screen.dart';
import 'package:myfirstflutter/model/offers_list_model.dart';

class PageViewHolder extends StatefulWidget {
  List<OfferListModel> items = [];
  int indexOfItem = 0;

  PageViewHolder({Key? key, required this.items, required this.indexOfItem})
      : super(key: key);

  @override
  State<PageViewHolder> createState() => _PageViewHolderState();
}

class _PageViewHolderState extends State<PageViewHolder> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
        initialPage: widget.indexOfItem, keepPage: true, viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.items.length,
      itemBuilder: (context, position) {
        return OfferDetailsScreen(offerListModel: widget.items[position]);
      },
    );
  }
}
