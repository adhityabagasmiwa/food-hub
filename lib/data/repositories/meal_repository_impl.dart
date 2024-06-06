import 'package:food_hub/data/endpoints.dart';
import 'package:food_hub/data/repositories/meal_repository.dart';
import 'package:food_hub/data/service/api_service.dart';
import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';

class MealRepositoryImpl extends MealRepository {
  late final ApiService _service;
  late final Endpoints _endpoints;

  MealRepositoryImpl(this._service, this._endpoints);

  @override
  Future<List<Meal>> getTrendingMeals(String query) async {
    var queryParams = {'s': query};
    var response = await _service.invokeHttp(
      _endpoints.mealSearch,
      RequestType.get,
      params: queryParams,
    );

    var data = (response['meals'] ?? []) as List<dynamic>;
    var list = data.map((json) => Meal.fromJson(json)).toList();
    var limitedData = data.take(3).map((json) => Meal.fromJson(json)).toList();
    var result = list.length > 3 ? limitedData : list;
    return result;
  }

  @override
  Future<List<CategoryMeal>> getCategoryMeals(
      Map<String, dynamic> params) async {
    var response = await _service.invokeHttp(
      _endpoints.mealCategory,
      RequestType.get,
    );

    var data = (response['categories'] ?? []) as List<dynamic>;
    return data.map((json) => CategoryMeal.fromJson(json)).toList();
  }
}
