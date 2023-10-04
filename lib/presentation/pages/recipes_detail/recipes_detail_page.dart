import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_controller.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class RecipesDetailPage extends StatefulWidget {
  final Recipe argument;

  const RecipesDetailPage({super.key, required this.argument});

  @override
  State<RecipesDetailPage> createState() => _RecipesDetailPageState();
}

class _RecipesDetailPageState extends State<RecipesDetailPage> {
  late final RecipesDetailController _controller;

  @override
  void initState() {
    super.initState();

    _controller = RecipesDetailController();
    _controller.setArgument(widget.argument);
    _controller.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.scrollController.dispose();
    _controller.scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.scrollController.offset <=
            _controller.scrollController.position.minScrollExtent &&
        !_controller.scrollController.position.outOfRange) {
      setState(() {
        _controller.topPositionScrollSize = 220.h;
      });
    } else {
      setState(() {
        _controller.topPositionScrollSize = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget recipesHeaderSection() {
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: _controller.argument.name,
              maxLines: 2,
              style: textStyleW600S24.copyWith(color: Colors.black),
            ),
            SizedBox(height: AppSizes.dimen8.h),
            Row(
              children: [
                const Icon(
                  Icons.album_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: AppSizes.dimen8.w),
                CommonText(
                  text: _controller.argument.category.name,
                  style: textStyleW500S14.copyWith(color: AppColors.textColor),
                ),
              ],
            ),
            SizedBox(height: AppSizes.dimen16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: AppSizes.size24.w,
                      height: AppSizes.size24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            '${AppStrings.iconPath}/${_controller.argument.creator.photoUrl}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.dimen8.w),
                    CommonText(
                      text: _controller.argument.creator.name,
                      style: textStyleW600S14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      size: AppSizes.size24,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: AppSizes.dimen4.w),
                    CommonText(
                      text: _controller.argument.rating.toString(),
                      style: textStyleW600S14.copyWith(color: Colors.black),
                    ),
                    SizedBox(width: AppSizes.dimen8.w),
                    CommonText(
                      text: '(${_controller.argument.totalRating})',
                      style: textStyleW500S12.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSizes.dimen16.h),
            const Divider(
              height: AppSizes.dimen4,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: AppSizes.dimen16.h),
            CommonText(
              text: 'Description',
              style: textStyleW600S16.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: AppSizes.dimen8.h),
            CommonText(
              text: _controller.argument.description,
              maxLines: 10,
              style: textStyleW500S14.copyWith(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget recipeIngredientsSection() {
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: AppSizes.dimen4,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: AppSizes.dimen16.h),
            CommonText(
              text: 'Ingredients',
              style: textStyleW600S16.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: AppSizes.dimen8.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.argument.ingredients.length,
              itemBuilder: (newContext, index) {
                var ingredient = _controller.argument.ingredients[index];

                return SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    leading: const Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                    ),
                    title: CommonText(
                      text: ingredient,
                      maxLines: 2,
                      style: textStyleW500S12.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    Widget recipeStepsSection() {
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: AppSizes.dimen4,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: AppSizes.dimen16.h),
            CommonText(
              text: 'Steps',
              style: textStyleW600S16.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: AppSizes.dimen16.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.argument.recipeStep.length,
              itemBuilder: (newContext, index) {
                var recipeStepData = _controller.argument.recipeStep[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.dimen8.h),
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: AppSizes.size24.w,
                          height: AppSizes.size24.h,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CommonText(
                              text: recipeStepData.number.toString(),
                              style: textStyleW500S12.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSizes.dimen16.w),
                        Expanded(
                          child: CommonText(
                            text: recipeStepData.description,
                            maxLines: 100,
                            style: textStyleW500S14.copyWith(
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: AppSizes.size300.h,
            child: Image.asset(
              '${AppStrings.imagePath}/${_controller.argument.photoUrl}',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.dimen20.w),
              child: AppBar(
                backgroundColor: Colors.transparent,
                leadingWidth: AppSizes.size36.w,
                leading: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_new_rounded
                          : Icons.arrow_back_rounded,
                    ),
                    iconSize: AppSizes.size16,
                    color: Colors.black,
                    onPressed: () => _controller.navigatePop(context),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: _controller.topPositionScrollSize,
            bottom: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radius36),
                    topRight: Radius.circular(AppSizes.radius36),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: _controller.scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.dimen24.w,
                      top: AppSizes.dimen16.h,
                      right: AppSizes.dimen24.w,
                      bottom: AppSizes.dimen16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: AppSizes.dimen54.w,
                            height: AppSizes.dimen8.h,
                            decoration: const BoxDecoration(
                              color: AppColors.textColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppSizes.radius12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.dimen16.h),
                        recipesHeaderSection(),
                        SizedBox(height: AppSizes.dimen16.h),
                        recipeIngredientsSection(),
                        SizedBox(height: AppSizes.dimen16.h),
                        recipeStepsSection()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
