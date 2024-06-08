import 'package:food_hub/domain/category_meal.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_use_case.dart';
import 'package:food_hub/use_case/get_category_meal_use_case.dart';
import 'package:food_hub/use_case/get_detail_meal_use_case.dart';
import 'package:food_hub/use_case/get_popular_meal_use_case.dart';
import 'package:food_hub/use_case/get_trending_meal_use_case.dart';
import 'package:get_it/get_it.dart';

class UseCaseModule {
  static void init() {
    var di = GetIt.I;

    di.registerFactory<BaseUseCase<List<Meal>, String>>(
      () => GetTrendingMealsUseCase(di.get()),
    );
    di.registerFactory<GetCategoryMealsUseCase>(
      () => GetCategoryMealsUseCase(di.get()),
    );
    di.registerFactory<BaseUseCase<List<CategoryMeal>, Map<String, dynamic>>>(
      () => GetCategoryMealsUseCase(di.get()),
    );
    di.registerFactory<BaseUseCase<Meal, String>>(
      () => GetDetailMealUseCase(di.get()),
    );
    di.registerFactory<GetPopularMealUseCase>(
      () => GetPopularMealUseCase(di.get()),
    );
  }
}
