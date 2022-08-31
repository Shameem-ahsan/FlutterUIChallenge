import 'package:flutter/material.dart';
import 'package:myfirstflutter/_shared/app_images.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppImages.vehicle,
              width: 20,
              height: 20,
            ),
            Image.asset(
              AppImages.vehicle,
              width: 20,
              height: 20,
            )
          ],
        )
      ],
    );
  }
}
