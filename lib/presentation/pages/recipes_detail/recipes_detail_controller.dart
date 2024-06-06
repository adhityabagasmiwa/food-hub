import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/recipe.dart';
import 'package:food_hub/presentation/base/base_controller.dart';

class RecipesDetailController extends BaseController {
  late final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  Recipe _argument = Recipe.defaultValue;
  Recipe get argument => _argument;

  double _topPositionScrollSize = 220.h;
  double get topPositionScrollSize => _topPositionScrollSize;

  @override
  void initListeners() {
    super.initListeners();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  void setArgument(Recipe argument) {
    _argument = argument;
  }

  void _scrollListener() {
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      _topPositionScrollSize = 220.h;
    } else {
      _topPositionScrollSize = 0;
    }
    refreshUI();
  }

  void navigatePop() {
    Navigator.pop(context);
  }
}
