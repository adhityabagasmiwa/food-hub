import 'dart:async' as dart;

import 'package:flutter/material.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/onboarding/onboarding_page.dart';

class SplashScreenController extends BaseController {
  @override
  void initListeners() {
    super.initListeners();
    _startSplashScreen();
  }

  dart.Timer _startSplashScreen() {
    var duration = const Duration(seconds: 2);

    return dart.Timer(duration, () {
      _navigateToOnboard();
    });
  }

  void _navigateToOnboard() {
    Navigator.pushReplacementNamed(context, OnboardingPage.route);
  }
}
