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

  double _topPositionScrollSize = 180.h;
  double get topPositionScrollSize => _topPositionScrollSize;

  @override
  void initListeners() {
    super.initListeners();
    _scrollController.addListener(_scrollListener);

    _initObserver();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  void _initObserver() {
    _presenter.onSuccess = (data) {
      _meal = data;
    };
    _presenter.onComplete = hideLoading;
    _presenter.onError = (e) {};
  }

  void _scrollListener() {
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double minScrollExtent = _scrollController.position.minScrollExtent;
    double currentOffset = _scrollController.offset;
    bool canScroll = maxScrollExtent - minScrollExtent > 0;

    if (canScroll) {
      double dynamicValue = (1 - (currentOffset / maxScrollExtent)) * 180.h;
      _topPositionScrollSize = dynamicValue.clamp(0.0, 180.h);
    } else {
      _topPositionScrollSize = 180.h;
    }
    refreshUI();
  }

  void getDetailMeal(String id) {
    showLoading();
    _presenter.onGetDetailMeal(id);
  }

  void navigatePop() {
    Navigator.pop(context);
  }
}
