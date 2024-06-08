import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class CommonCardVerticalRecipe extends StatelessWidget {
  final Meal mealData;
  final Function() onTap;

  const CommonCardVerticalRecipe({
    super.key,
    required this.mealData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.dimen8.w,
                vertical: AppSizes.dimen12.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: mealData.strMeal,
                    style: textStyleW700S14.copyWith(color: Colors.black),
                  ),
                  CommonText(
                    text: mealData.strCategory,
                    style: textStyleW400S10.copyWith(color: Colors.black),
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
