import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_hub/data/dio_interceptor.dart';
import 'package:food_hub/data/endpoints.dart';
import 'package:food_hub/presentation/di/controller_module.dart';
import 'package:food_hub/presentation/di/presenter_module.dart';
import 'package:food_hub/presentation/di/repository_module.dart';
import 'package:food_hub/presentation/di/use_case_module.dart';
import 'package:get_it/get_it.dart';

class AppModule {
  static Future<void> _init() async {
    var di = GetIt.I;
    di.registerLazySingleton(() => Endpoints(dotenv.env['BASE_URL'] ?? ''));

    di.registerFactory(() {
      var dio = Dio();

      dio.options.connectTimeout = const Duration(seconds: 60000);
      dio.options.receiveTimeout = const Duration(seconds: 60000);
      var endpoints = di.get<Endpoints>();

      // use for log response and request data
      if (!kReleaseMode) {
        dio.interceptors.add(DioInterceptor());
      }
      dio.options.baseUrl = endpoints.baseUrl;

      return dio;
    });
  }

  static Future<void> registerAllModules() async {
    await _init();
    ControllerModule.init();
    PresenterModule.init();
    RepositoryModule.init();
    UseCaseModule.init();
  }
}
