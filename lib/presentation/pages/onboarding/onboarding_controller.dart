import 'package:flutter/material.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:food_hub/presentation/pages/home/home_page.dart';

class OnboardingController extends BaseController {
  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomePage.route);
  }
}
