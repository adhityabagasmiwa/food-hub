import 'package:flutter/material.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_page.dart';

class HomeController {
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
  }

  void setFilterPopularRecipes(String category) {
    _popularRecipes = Recipe.popularRecipes;

    if (category != 'all') {
      _popularRecipes = _popularRecipes
          .where((element) =>
              element.category.name.toLowerCase() == category.toLowerCase())
          .toList();
    }
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

  void navigateToRecipeSearch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RecipesSearchPage(),
      ),
    );
  }
}
