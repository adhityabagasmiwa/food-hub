import 'package:flutter/material.dart';
import 'package:food_hub/presentation/pages/home/home_page.dart';
import 'package:food_hub/presentation/pages/onboarding/onboarding_page.dart';
import 'package:food_hub/presentation/pages/recipes_detail/recipes_detail_page.dart';
import 'package:food_hub/presentation/pages/recipes_search/recipes_search_page.dart';
import 'package:food_hub/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:get_it/get_it.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    var di = GetIt.I;

    switch (settings?.name) {
      case SplashScreenPage.route:
        return _buildRoute(settings, SplashScreenPage(controller: di.get()));
      case OnboardingPage.route:
        return _buildRoute(settings, OnboardingPage(controller: di.get()));
      case HomePage.route:
        return _buildRoute(settings, HomePage(controller: di.get()));
      case RecipesSearchPage.route:
        return _buildRoute(settings, RecipesSearchPage(controller: di.get()));
      case RecipesDetailPage.route:
        var mealId = settings?.arguments as String;
        return _buildRoute(
          settings,
          RecipesDetailPage(controller: di.get(), mealId: mealId),
        );
      default:
        return null;
    }
  }

  PageRouteBuilder _buildRoute(RouteSettings? settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
