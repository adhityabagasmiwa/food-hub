import 'package:food_hub/presentation/pages/home/home_presenter.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_presenter.dart';
import 'package:get_it/get_it.dart';

class PresenterModule {
  static void init() {
    var di = GetIt.I;

    di.registerFactory(
      () => HomePresenter(
        di.get(),
        di.get(),
        di.get(),
      ),
    );
    di.registerFactory(() => RecipesDetailPresenter(di.get()));
  }
}
