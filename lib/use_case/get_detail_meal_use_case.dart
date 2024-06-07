import 'package:food_hub/data/repositories/meal_repository.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_use_case.dart';

class GetDetailMealUseCase extends BaseUseCase<Meal, String> {
  late final MealRepository _repository;

  GetDetailMealUseCase(this._repository);

  @override
  Future<Meal> getData(String request) {
    return _repository.getDetailMeal(request);
  }
}
