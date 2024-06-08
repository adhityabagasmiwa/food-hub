import 'package:food_hub/data/repositories/meal_repository.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_use_case.dart';

class GetPopularMealUseCase extends BaseUseCase<List<Meal>, String> {
  late final MealRepository _repository;

  GetPopularMealUseCase(this._repository);

  @override
  Future<List<Meal>> getData(String request) {
    return _repository.getPopularMeals(request);
  }
}
