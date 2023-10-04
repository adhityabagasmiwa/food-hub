import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class CommonCardHorizontalRecipe extends StatelessWidget {
  final Recipe recipeData;
  final Function() onTap;

  const CommonCardHorizontalRecipe({
    super.key,
    required this.recipeData,
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
          mainAxisSize: MainAxisSize.max,
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
                    child: Image.asset(
                      '${AppStrings.imagePath}/${recipeData.photoUrl}',
                      fit: BoxFit.cover,
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonText(
                            text: recipeData.rating.toString(),
                            style: textStyleW700S12.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: AppSizes.dimen4.w),
                          const Icon(
                            Icons.star_rate_rounded,
                            size: AppSizes.size16,
                            color: AppColors.primaryColor,
                          ),
                        ],
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
                children: [
                  CommonText(
                    text: recipeData.name,
                    maxLines: 2,
                    style: textStyleW700S16.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: AppSizes.dimen8.h),
                  Row(
                    children: [
                      Container(
                        width: AppSizes.size24.w,
                        height: AppSizes.size24.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              '${AppStrings.iconPath}/${recipeData.creator.photoUrl}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.dimen8.w),
                      CommonText(
                        text: recipeData.creator.name,
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
