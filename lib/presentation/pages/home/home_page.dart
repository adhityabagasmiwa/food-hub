import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/presentation/base/base_view.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/pages/home/home_controller.dart';
import 'package:food_hub/presentation/widgets/common_cardh_recipe.dart';
import 'package:food_hub/presentation/widgets/common_cardv_recipe.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class HomePage extends BasePage<HomeController> {
  HomePage({Key? key, required super.controller}) : super(key: key);

  static const String route = '/home';

  @override
  Widget get view => ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
          Orientation orientation = MediaQuery.of(context).orientation;

          Widget trendingRecipesSection(BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.dimen24.w),
                  child: CommonText(
                    text: 'Trending Recipes',
                    style: textStyleW600S18.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(height: AppSizes.dimen8.h),
                SizedBox(
                  height: orientation == Orientation.landscape
                      ? AppSizes.size300.h
                      : AppSizes.size220.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.trendingMeals.length,
                    itemBuilder: (newContext, index) {
                      var mealData = controller.trendingMeals[index];

                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0
                              ? AppSizes.dimen24.w
                              : AppSizes.dimen8.w,
                          right: index == controller.trendingMeals.length - 1
                              ? AppSizes.dimen24.w
                              : AppSizes.dimen8.w,
                        ),
                        child: CommonCardHorizontalRecipe(
                          mealData: mealData,
                          onTap: () {
                            controller.navigateToRecipeDetail(
                              id: mealData.idMeal,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          Widget popularRecipesSection(BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.dimen24.w),
                  child: CommonText(
                    text: 'Popular Category',
                    style: textStyleW600S18.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(height: AppSizes.dimen16.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.dimen24.w,
                    ),
                    child: Wrap(
                      spacing: 8,
                      children: controller.categoryMeals
                          .map(
                            (e) => ChoiceChip(
                              label: CommonText(
                                text: e.strCategory,
                                style: textStyleW500S12,
                              ),
                              elevation: 0.75,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Colors.transparent,
                              labelStyle: TextStyle(
                                color: controller.categoryIdSelected ==
                                        e.idCategory
                                    ? AppColors.white
                                    : AppColors.primaryColor,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius:
                                    BorderRadius.circular(AppSizes.size24),
                              ),
                              side: BorderSide.none,
                              showCheckmark: false,
                              selectedColor: AppColors.primaryColor,
                              selected:
                                  controller.categoryIdSelected == e.idCategory,
                              onSelected: (_) {
                                controller.setSelectedCategory(
                                  id: e.idCategory,
                                  category: e.strCategory.toLowerCase(),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.dimen16.h),
                controller.isLoadingPopularMeals
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.dimen24.w),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppSizes.dimen12.h,
                            mainAxisSpacing: AppSizes.dimen12.w,
                            mainAxisExtent: orientation == Orientation.landscape
                                ? AppSizes.size240.h
                                : AppSizes.size190.h,
                          ),
                          itemCount: controller.popularMeals.length,
                          itemBuilder: (newContext, index) {
                            var popularMeals = controller.popularMeals[index];

                            return CommonCardVerticalRecipe(
                              mealData: popularMeals,
                              onTap: () {
                                controller.navigateToRecipeDetail(
                                  id: popularMeals.idMeal,
                                );
                              },
                            );
                          },
                        ),
                      ),
              ],
            );
          }

          Widget searchSection({required Function()? onTap}) {
            return InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppSizes.dimen48),
              child: ListTile(
                tileColor: AppColors.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.dimen48),
                ),
                leading: const Icon(
                  Icons.search,
                  color: AppColors.textSecondaryColor,
                ),
                title: CommonText(
                  text: 'Search food recipes...',
                  style: textStyleW500S14.copyWith(color: AppColors.textColor),
                ),
              ),
            );
          }

          return Scaffold(
            key: globalKey,
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: controller.isLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: AppSizes.dimen24.w,
                                      top: AppSizes.dimen16.h,
                                      right: AppSizes.dimen24.w,
                                      bottom: AppSizes.dimen24.h,
                                    ),
                                    child: Text(
                                      'Find best recipes\nfor cooking',
                                      style: textStyleW700S24.copyWith(
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.dimen24.w,
                                    ),
                                    child: searchSection(
                                      onTap: controller.navigateToRecipeSearch,
                                    ),
                                  ),
                                  SizedBox(height: AppSizes.dimen24.h),
                                  trendingRecipesSection(context),
                                  SizedBox(height: AppSizes.dimen16.h),
                                  popularRecipesSection(context),
                                  SizedBox(height: AppSizes.dimen16.h),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          );
        },
      );
}
