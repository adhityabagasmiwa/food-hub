import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/domain/recipe.dart';

class RecipesDetailController {
  late final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  Recipe _argument = Recipe.defaultValue;
  Recipe get argument => _argument;

  double topPositionScrollSize = 220.h;

  void setArgument(Recipe argument) {
    _argument = argument;
  }

  void navigatePop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
