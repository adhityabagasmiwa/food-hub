import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_hub/presentation/base/base_view.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/pages/splash_screen/splash_screen_controller.dart';

class SplashScreenPage extends BasePage<SplashScreenController> {
  SplashScreenPage({Key? key, required super.controller}) : super(key: key);

  static const String route = '/splash';

  @override
  Widget get view => ControlledWidgetBuilder<SplashScreenController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            backgroundColor: AppColors.primaryColor,
            body: Center(
              child: SvgPicture.asset(
                '${AppStrings.iconPath}/ic_food_hub_logo.svg',
              ),
            ),
          );
        },
      );
}
