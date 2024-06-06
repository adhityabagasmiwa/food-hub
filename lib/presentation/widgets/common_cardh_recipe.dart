import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonCardHorizontalRecipe extends StatelessWidget {
  final Meal mealData;
  final Function() onTap;

  const CommonCardHorizontalRecipe({
    super.key,
    required this.mealData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.size300.w,
      margin: EdgeInsets.symmetric(vertical: AppSizes.dimen8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: AppSizes.size120.h,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radius16),
                      topRight: Radius.circular(AppSizes.radius16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: mealData.strMealThumb,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        width: AppSizes.dimen120.h,
                        height: AppSizes.dimen120.h,
                        child: const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.dimen12.h,
                      horizontal: AppSizes.dimen16.w,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.dimen4.h,
                        horizontal: AppSizes.dimen8.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppSizes.radius20),
                      ),
                      child: CommonText(
                        text: mealData.strCategory,
                        style: textStyleW700S12.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.dimen12.h,
                horizontal: AppSizes.dimen16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: mealData.strMeal,
                    maxLines: 2,
                    style: textStyleW700S16.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: AppSizes.dimen8.h),
                  Row(
                    children: [
                      Container(
                        width: AppSizes.size24.w,
                        height: AppSizes.size24.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              '${AppStrings.iconPath}/ic_creator_1.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.dimen8.w),
                      CommonText(
                        // text: recipeData.creator.name,
                        text: mealData.strArea,
                        style: textStyleW400S12.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
