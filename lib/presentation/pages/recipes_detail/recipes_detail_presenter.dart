import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_presenter.dart';

class RecipesDetailPresenter extends BasePresenter<Meal, String> {
  RecipesDetailPresenter(super.useCase);

  void onGetDetailMeal(String request) {
    execute(request: request);
  }
}
