import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class CommonCardVerticalRecipe extends StatelessWidget {
  final Recipe recipeData;
  final Function() onTap;

  const CommonCardVerticalRecipe({
    super.key,
    required this.recipeData,
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
                child: Image.asset(
                  '${AppStrings.imagePath}/${recipeData.photoUrl}',
                  fit: BoxFit.cover,
                  height: AppSizes.size120.h,
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
                    text: recipeData.name,
                    style: textStyleW700S14.copyWith(color: Colors.black),
                  ),
                  CommonText(
                    text: recipeData.category.name,
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
