import 'package:flutter/material.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';

class RecipeSearchController extends BaseController {
  final SearchController _searchController = SearchController();
  SearchController get searchController => _searchController;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  bool _isSearch = false;
  bool get isSearch => _isSearch;

  void searchRecipes(String query) {
    _recipes = [];

    if (query == '') {
      _recipes = [];
    } else {
      _recipes.addAll(Recipe.trendingRecipes);
      _recipes.addAll(Recipe.popularRecipes);

      _recipes = _recipes
          .where((element) => element.name.toLowerCase().contains(query))
          .toList();
    }
    refreshUI();
  }

  void setHasSearched(bool isSearch) {
    _isSearch = isSearch;
    refreshUI();
  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToRecipeDetail({required Recipe argument}) {
    Navigator.pushNamed(context, RecipesDetailPage.route, arguments: argument);
  }
}
