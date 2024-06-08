import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_presenter.dart';
import 'package:food_hub/use_case/get_category_meal_use_case.dart';
import 'package:food_hub/use_case/get_popular_meal_use_case.dart';

class HomePresenter extends BasePresenter<List<Meal>, String> {
  final GetCategoryMealsUseCase _getCategoryMealsUseCase;
  final GetPopularMealUseCase _getPopularMealUseCase;

  HomePresenter(
    super.useCase,
    this._getCategoryMealsUseCase,
    this._getPopularMealUseCase,
  );

  late Function(List<CategoryMeal>) onSuccessGetCategoryMeals;
  late Function(dynamic) onErrorGetCategoryMeals;
  late Function() onCompleteGetCategoryMeals;

  late Function(List<Meal>) onSuccessGetPopularMeals;
  late Function(dynamic) onErrorGetPopularMeals;
  late Function() onCompleteGetPopularMeals;

  void onGetTrendingMeals(String request) {
    execute(request: request);
  }

  void onGetCategoryMeals(Map<String, dynamic> request) async {
    try {
      var data = await _getCategoryMealsUseCase.execute(request: request);
      onSuccessGetCategoryMeals(data);
    } catch (e) {
      onErrorGetCategoryMeals(e);
    } finally {
      onCompleteGetCategoryMeals();
    }
  }

  void onGetPopularMeals(String request) async {
    try {
      var data = await _getPopularMealUseCase.execute(request: request);
      onSuccessGetPopularMeals(data);
    } catch (e) {
      onErrorGetPopularMeals(e);
    } finally {
      onCompleteGetPopularMeals();
    }
  }
}
