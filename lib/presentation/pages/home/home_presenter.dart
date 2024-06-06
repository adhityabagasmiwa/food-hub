import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_presenter.dart';
import 'package:food_hub/use_case/get_category_meal_use_case.dart';

class HomePresenter extends BasePresenter<List<Meal>, String> {
  final GetCategoryMealsUseCase _getCategoryMealsUseCase;

  HomePresenter(super.useCase, this._getCategoryMealsUseCase);

  late Function(List<CategoryMeal>) onSuccessGetCategoryMeals;
  late Function(dynamic) onErrorGetCategoryMeals;
  late Function() onCompleteGetCategoryMeals;

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
}
