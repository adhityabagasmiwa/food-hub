import 'package:food_hub/data/repositories/meal_repository.dart';
import 'package:food_hub/data/repositories/meal_repository_impl.dart';
import 'package:get_it/get_it.dart';

class RepositoryModule {
  static void init() {
    var di = GetIt.I;

    di.registerFactory<MealRepository>(
      () => MealRepositoryImpl(di.get(), di.get()),
    );
  }
}
