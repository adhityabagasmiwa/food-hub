import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/presentation/di/app_module.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/router.dart' as custom_router;
import 'package:food_hub/presentation/misc/scroll_behaviour.dart';
import 'package:food_hub/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await _initApp();
  runApp(MyApp());
}

Future<void> _initApp() async {
  ScreenUtil.ensureScreenSize();

  try {
    await dotenv.load(fileName: '.env');
    await AppModule.registerAllModules();
  } catch (e, stackTrace) {
    if (kDebugMode) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
    }
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late final custom_router.Router _router = custom_router.Router();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Food Hub',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: SplashScreenPage(controller: GetIt.I.get()),
        onGenerateRoute: _router.getRoute,
        builder: (_, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child ?? const SizedBox(),
          );
        },
        navigatorObservers: [_router.routeObserver],
      ),
    );
  }
}
