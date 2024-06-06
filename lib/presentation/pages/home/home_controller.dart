import 'package:flutter/material.dart';
import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/home/home_presenter.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_page.dart';

class HomeController extends BaseController {
  final HomePresenter _presenter;

  HomeController(this._presenter);

  final SearchController _searchController = SearchController();
  SearchController get searchController => _searchController;

  final List<Meal> _trendingMeals = [];
  List<Meal> get trendingMeals => _trendingMeals;

  List<Recipe> _popularRecipes = Recipe.popularRecipes;
  List<Recipe> get popularRecipes => _popularRecipes;

  final List<CategoryMeal> _categoryMeals = [];
  List<CategoryMeal> get categoryMeals => _categoryMeals;

  String _categoryIdSelected = '0';
  String get categoryIdSelected => _categoryIdSelected;

  @override
  void initListeners() {
    super.initListeners();

    _initObserver();
    _getTrendingMeals();
    _getCategoryMeals();
  }

  void _initObserver() {
    _presenter.onSuccess = (data) {
      _trendingMeals.clear();
      _trendingMeals.addAll(data);
    };
    _presenter.onComplete = hideLoading;
    _presenter.onError = (error) {};

    _presenter.onSuccessGetCategoryMeals = (data) {
      _categoryMeals.clear();
      _categoryMeals.addAll(data);
    };
    _presenter.onComplete = hideLoading;
    _presenter.onErrorGetCategoryMeals = (error) {};
  }

  void _getTrendingMeals() {
    showLoading();
    _presenter.onGetTrendingMeals('');
  }

  void _getCategoryMeals() {
    showLoading();
    _presenter.onGetCategoryMeals(<String, dynamic>{});
  }

  void setSelectedCategory({
    required String id,
    required String category,
  }) {
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

  void navigateToRecipeDetail({required Meal argument}) {
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
