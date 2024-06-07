import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/meal.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_presenter.dart';

class RecipesDetailController extends BaseController {
  final RecipesDetailPresenter _presenter;

  RecipesDetailController(this._presenter);

  late final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  late Meal _meal;
  Meal get meal => _meal;

  double _topPositionScrollSize = 220.h;
  double get topPositionScrollSize => _topPositionScrollSize;

  @override
  void initListeners() {
    super.initListeners();
    // _scrollController.addListener(_scrollListener);

    _initObserver();
  }

  @override
  void dispose() {
    super.dispose();
    // _scrollController.dispose();
    // _scrollController.removeListener(_scrollListener);
  }

  void _initObserver() {
    _presenter.onSuccess = (data) {
      _meal = data;
    };
    _presenter.onComplete = hideLoading;
    _presenter.onError = (e) {};
  }

  // void _scrollListener() {
  //   if (_scrollController.offset <=
  //           _scrollController.position.minScrollExtent &&
  //       !_scrollController.position.outOfRange) {
  //     _topPositionScrollSize = 220.h;
  //   } else {
  //     _topPositionScrollSize = 0;
  //   }
  //   refreshUI();
  // }

  void getDetailMeal(String id) {
    showLoading();
    _presenter.onGetDetailMeal(id);
  }

  void navigatePop() {
    Navigator.pop(context);
  }
}
