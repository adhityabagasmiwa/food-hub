import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> getTrendingMeals(String query);
  Future<List<CategoryMeal>> getCategoryMeals(Map<String, dynamic> params);
}
