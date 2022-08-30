import 'package:flutter/material.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  final Size preferredSize;

  CustomAppBar() : preferredSize = const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBarColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Shameem",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal)),
          Text("TQDR-B-3525-R",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        )
      ],
    );
  }
}
