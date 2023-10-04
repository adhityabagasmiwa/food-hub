import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_strings.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_controller.dart';
import 'package:food_hub/presentation/widgets/common_cardv_recipe.dart';
import 'package:food_hub/presentation/widgets/common_search_bar.dart';
import 'package:food_hub/presentation/widgets/common_text.dart';

class RecipesSearchPage extends StatefulWidget {
  const RecipesSearchPage({super.key});

  @override
  State<RecipesSearchPage> createState() => _RecipesSearchPageState();
}

class _RecipesSearchPageState extends State<RecipesSearchPage> {
  late final RecipeSearchController _controller;

  @override
  void initState() {
    super.initState();

    _controller = RecipeSearchController();
  }

  void setHasSearched(bool isSearch) {
    setState(() {
      _controller.isSearch = isSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

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
              style: textStyleW600S18.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();

          setState(() {
            setHasSearched(false);
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.dimen20.w),
                child: Row(
                  children: [
                    Visibility(
                      visible: !_controller.isSearch,
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
                          onPressed: () => _controller.navigatePop(context),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.dimen8.w),
                    Expanded(
                      child: CommonSearchBar(
                        controller: _controller.searchController,
                        hintText: 'Search food recipes...',
                        onTap: () {
                          setHasSearched(true);
                        },
                        onSumbitted: (value) {
                          _controller.searchRecipes(value.toLowerCase());
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (value) {
                          setState(() {
                            _controller.searchController.text = value;
                          });

                          setHasSearched(_controller.searchController.text != '');
                        },
                        onClear: () {
                          setState(() {
                            _controller.searchController.text = '';
                          });

                          _controller.searchRecipes(
                            _controller.searchController.text.toLowerCase(),
                          );
                          FocusScope.of(context).unfocus();
                          setHasSearched(false);
                        },
                        showTrailingIcon:
                            _controller.searchController.text != '',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.dimen16.h),
              Visibility(
                visible: _controller.recipes.isEmpty,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.dimen120.h),
                  child: searchSection(),
                ),
              ),
              Visibility(
                visible: _controller.recipes.isNotEmpty,
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.dimen24.w,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppSizes.dimen12.h,
                        mainAxisSpacing: AppSizes.dimen12.w,
                        mainAxisExtent: AppSizes.size180.h,
                      ),
                      itemCount: _controller.recipes.length,
                      itemBuilder: (newContext, index) {
                        var recipeData = _controller.recipes[index];

                        return CommonCardVerticalRecipe(
                          recipeData: recipeData,
                          onTap: () {
                            _controller.navigateToRecipeDetail(
                              context: context,
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
  }
}
