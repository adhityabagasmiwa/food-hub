import 'package:food_hub/data/repositories/meal_repository.dart';
import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/presentation/base/base_use_case.dart';

class GetCategoryMealsUseCase
    extends BaseUseCase<List<CategoryMeal>, Map<String, dynamic>> {
  late final MealRepository _repository;

  GetCategoryMealsUseCase(this._repository);

  @override
  Future<List<CategoryMeal>> getData(Map<String, dynamic> request) {
    return _repository.getCategoryMeals(request);
  }
}
