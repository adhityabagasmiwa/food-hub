import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/presentation/base/base_view.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_controller.dart';
import 'package:food_hub/presentation/widgets/common_cardv_recipe.dart';
import 'package:food_hub/presentation/widgets/common_search_bar.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class RecipesSearchPage extends BasePage<RecipeSearchController> {
  RecipesSearchPage({Key? key, required super.controller}) : super(key: key);

  static const String route = '/recipes-search';

  @override
  Widget get view => ControlledWidgetBuilder<RecipeSearchController>(
        builder: (context, controller) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          Orientation orientation = MediaQuery.of(context).orientation;

          Widget searchSection() {
            return SizedBox(
              child: Column(
                children: [
                  Image.asset(
                    '${AppStrings.imagePath}/img_search_food.png',
                    fit: BoxFit.cover,
                    height: AppSizes.size120.h,
                  ),
                  SizedBox(height: AppSizes.dimen16.h),
                  CommonText(
                    text: 'Find best recipes\nfor cooking',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: textStyleW600S18.copyWith(
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
                controller.setHasSearched(false);
              }
            },
            child: Scaffold(
              key: globalKey,
              backgroundColor: AppColors.white,
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.dimen20.w),
                      child: Row(
                        children: [
                          Visibility(
                            visible: !controller.isSearch,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.backgroundColor,
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
                                onPressed: () =>
                                    controller.navigatePop(context),
                              ),
                            ),
                          ),
                          SizedBox(width: AppSizes.dimen8.w),
                          Expanded(
                            child: CommonSearchBar(
                              controller: controller.searchController,
                              hintText: 'Search food recipes...',
                              onTap: () {
                                controller.setHasSearched(true);
                              },
                              onSumbitted: (value) {
                                controller.searchRecipes(value.toLowerCase());
                                FocusScope.of(context).unfocus();
                              },
                              onChanged: (value) {
                                controller.searchController.text = value;
                                controller.setHasSearched(
                                  controller.searchController.text != '',
                                );
                              },
                              onClear: () {
                                controller.searchController.text = '';
                                controller.searchRecipes(
                                  controller.searchController.text
                                      .toLowerCase(),
                                );
                                FocusScope.of(context).unfocus();
                                controller.setHasSearched(false);
                              },
                              showTrailingIcon:
                                  controller.searchController.text != '',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.dimen16.h),
                    Visibility(
                      visible: controller.recipes.isEmpty,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: orientation == Orientation.landscape
                              ? AppSizes.size24.h
                              : AppSizes.dimen120.h,
                        ),
                        child: searchSection(),
                      ),
                    ),
                    Visibility(
                      visible: controller.recipes.isNotEmpty,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.dimen24.w,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppSizes.dimen12.h,
                              mainAxisSpacing: AppSizes.dimen12.w,
                              mainAxisExtent:
                                  orientation == Orientation.landscape
                                      ? AppSizes.size240.h
                                      : AppSizes.size190.h,
                            ),
                            itemCount: controller.recipes.length,
                            itemBuilder: (newContext, index) {
                              var recipeData = controller.recipes[index];

                              return CommonCardVerticalRecipe(
                                recipeData: recipeData,
                                onTap: () {
                                  controller.navigateToRecipeDetail(
                                    argument: recipeData,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
