import 'package:food_hub/presentation/pages/home/home_controller.dart';
import 'package:food_hub/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_controller.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_controller.dart';
import 'package:food_hub/presentation/pages/splash_screen/splash_screen_controller.dart';
import 'package:get_it/get_it.dart';

class ControllerModule {
  static void init() {
    var di = GetIt.I;

    di.registerFactory(() => SplashScreenController());
    di.registerFactory(() => OnboardingController());
    di.registerFactory(() => HomeController(di.get()));
    di.registerFactory(() => RecipesDetailController());
    di.registerFactory(() => RecipeSearchController());
  }
}
