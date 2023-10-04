import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/pages/splash_screen/splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late final SplashScreenController _controller;

  @override
  void initState() {
    super.initState();

    _controller = SplashScreenController();
    _controller.startSplashScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset('${AppStrings.iconPath}/ic_food_hub_logo.svg'),
      ),
    );
  }
}
