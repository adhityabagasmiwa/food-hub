import 'package:flutter/material.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_presenter.dart';

class RecipeSearchController extends BaseController {
  final RecipesSearchPresenter _presenter;

  RecipeSearchController(this._presenter);

  final SearchController _searchController = SearchController();
  SearchController get searchController => _searchController;

  final List<Meal> _meals = [];
  List<Meal> get meals => _meals;

  bool _isSearch = false;
  bool get isSearch => _isSearch;

  @override
  void initListeners() {
    super.initListeners();

    _initObserver();
  }

  void _initObserver() {
    _presenter.onSuccess = (data) {
      _meals.clear();
      _meals.addAll(data);
    };
    _presenter.onComplete = hideLoading;
    _presenter.onError = (e) {};
  }

  void _getSearchMeals(String query) {
    showLoading();
    _presenter.onGetDetailMeal(query);
  }

  void searchRecipes(String query) {
    if (query != '') {
      _getSearchMeals(query);
    } else {
      _meals.clear();
    }
  }

  void setHasSearched(bool isSearch) {
    _isSearch = isSearch;
    refreshUI();
  }

  void navigatePop() {
    Navigator.pop(context);
  }

  void navigateToRecipeDetail({required String id}) {
    Navigator.pushNamed(
      context,
      RecipesDetailPage.route,
      arguments: id,
    );
  }
}
