import 'package:flutter/material.dart';
import 'package:myfirstflutter/_shared/app_colors.dart';
import 'package:myfirstflutter/_shared/app_images.dart';
import 'package:myfirstflutter/_common_widgets/screen_presenter.dart';
import 'package:myfirstflutter/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _showLandingScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splashBackground,
      child: Center(
          child: Image.asset(
            AppImages.splashBottomLogo,
            width: 145,
            height: 90,
          )),
    );
  }


  _showLandingScreen() async {
    var _ = await Future.delayed(const Duration(milliseconds: 2000));
    ScreenPresenter.presentAndRemoveAllPreviousScreens(const HomeScreen(), context);
  }

}