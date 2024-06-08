import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_presenter.dart';

class RecipesSearchPresenter extends BasePresenter<List<Meal>, String> {
  RecipesSearchPresenter(super.useCase);

  void onGetDetailMeal(String request) {
    execute(request: request);
  }
}
