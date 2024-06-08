import 'package:flutter/material.dart';
import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';
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

  List<Meal> _popularMeals = [];
  List<Meal> get popularMeals => _popularMeals;

  final List<CategoryMeal> _categoryMeals = [];
  List<CategoryMeal> get categoryMeals => _categoryMeals;

  String _categoryIdSelected = '0';
  String get categoryIdSelected => _categoryIdSelected;

  bool _isLoadingPopularMeals = false;
  bool get isLoadingPopularMeals => _isLoadingPopularMeals;

  String _categorySelected = '';

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
      _categoryIdSelected = data.first.idCategory;
      _categorySelected = data.first.strCategory;
    };
    _presenter.onCompleteGetCategoryMeals = getPopularMeals;
    _presenter.onErrorGetCategoryMeals = (error) {};

    _presenter.onSuccessGetPopularMeals = (data) {
      _popularMeals.clear();
      _popularMeals.addAll(data);
    };
    _presenter.onCompleteGetPopularMeals = () {
      hideLoadingPopularMeal();
      setFilterPopularRecipes(_categorySelected);
    };
    _presenter.onErrorGetPopularMeals = (error) {};
  }

  void _getTrendingMeals() {
    showLoading();
    _presenter.onGetTrendingMeals('');
  }

  void _getCategoryMeals() {
    showLoading();
    _presenter.onGetCategoryMeals(<String, dynamic>{});
  }

  void showLoadingPopularMeal() {
    _isLoadingPopularMeals = true;
  }

  void hideLoadingPopularMeal() {
    _isLoadingPopularMeals = false;
  }

  void getPopularMeals() {
    showLoadingPopularMeal();
    _presenter.onGetPopularMeals('');
  }

  void setSelectedCategory({
    required String id,
    required String category,
  }) {
    _categoryIdSelected = id;
    _categorySelected = category;
    setFilterPopularRecipes(category);
    getPopularMeals();
    refreshUI();
  }

  void setFilterPopularRecipes(String category) {
    _popularMeals = _popularMeals
        .where((element) =>
            element.strCategory.toLowerCase() == category.toLowerCase())
        .toList();
    refreshUI();
  }

  void navigateToRecipeDetail({required String id}) {
    Navigator.pushNamed(
      context,
      RecipesDetailPage.route,
      arguments: id,
    );
  }

  void navigateToRecipeSearch() {
    Navigator.pushNamed(context, RecipesSearchPage.route);
  }
}
