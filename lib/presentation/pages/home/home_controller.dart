import 'package:flutter/material.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_page.dart';

class HomeController extends BaseController {
  final SearchController _searchController = SearchController();
  SearchController get searchController => _searchController;

  final List<Recipe> _trendingRecipes = Recipe.trendingRecipes;
  List<Recipe> get trendingRecipes => _trendingRecipes;

  List<Recipe> _popularRecipes = Recipe.popularRecipes;
  List<Recipe> get popularRecipes => _popularRecipes;

  final List<Category> _categoryRecipes = Category.categoryRecipes;
  List<Category> get categoryRecipes => _categoryRecipes;

  int _categoryIdSelected = 0;
  int get categoryIdSelected => _categoryIdSelected;

  void setSelectedCategory({required int id, required String category}) {
    _categoryIdSelected = id;
    setFilterPopularRecipes(category);
    refreshUI();
  }

  void setFilterPopularRecipes(String category) {
    _popularRecipes = Recipe.popularRecipes;

    if (category != 'all') {
      _popularRecipes = _popularRecipes
          .where((element) =>
              element.category.name.toLowerCase() == category.toLowerCase())
          .toList();
    }
    refreshUI();
  }

  void navigateToRecipeDetail({required Recipe argument}) {
    Navigator.pushNamed(
      context,
      RecipesDetailPage.route,
      arguments: argument,
    );
  }

  void navigateToRecipeSearch() {
    Navigator.pushNamed(context, RecipesSearchPage.route);
  }
}
