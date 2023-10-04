import 'package:flutter/material.dart';
import 'package:food_hub/presentation/pages/home/home_page.dart';

class OnboardingController {
  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
