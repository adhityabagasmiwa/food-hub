import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_hub/presentation/base/base_view.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:food_hub/presentation/widgets/common_button.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class OnboardingPage extends BasePage<OnboardingController> {
  OnboardingPage({Key? key, required super.controller}) : super(key: key);

  static const String route = '/onboarding';

  @override
  Widget get view => ControlledWidgetBuilder<OnboardingController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    '${AppStrings.imagePath}/img_onboard_background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      colors: [
                        Colors.transparent,
                        AppColors.darkBlue,
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: AppSizes.dimen54.h),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SvgPicture.asset(
                              '${AppStrings.iconPath}/ic_food_hub_logo.svg',
                            ),
                          ),
                          SizedBox(height: AppSizes.dimen120.h),
                          CommonText(
                            text: 'Start\nCooking',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: textStyleW700S54.copyWith(
                                color: AppColors.white),
                          ),
                          SizedBox(height: AppSizes.dimen8.h),
                          CommonText(
                            text: 'Find best recipes for cooking',
                            style: textStyleW400S16.copyWith(
                                color: AppColors.white),
                          ),
                          SizedBox(height: AppSizes.dimen48.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.dimen48.w,
                            ),
                            child: CommonButton(
                              text: 'Get Started',
                              textColor: AppColors.white,
                              backgroundColor: AppColors.primaryColor,
                              onPressed: controller.navigateToHome,
                            ),
                          ),
                          SizedBox(height: AppSizes.dimen54.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
