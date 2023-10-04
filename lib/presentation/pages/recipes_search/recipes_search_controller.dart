import 'package:flutter/material.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';

class RecipeSearchController {
  final SearchController _searchController = SearchController();
  SearchController get searchController => _searchController;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  bool isSearch = false;

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
  }

  void navigatePop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void navigateToRecipeDetail({
    required BuildContext context,
    required Recipe argument,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RecipesDetailPage(argument: argument),
      ),
    );
  }
}
