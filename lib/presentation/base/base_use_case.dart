import 'package:flutter/foundation.dart';

abstract class BaseUseCase<DOMAIN, REQUEST> {
  Future<DOMAIN> execute({required REQUEST request}) async {
    try {
      var data = await getData(request);
      return data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e');
        print('StackTrace: $stackTrace');
      }

      rethrow;
    }
  }

  Future<DOMAIN> getData(REQUEST request);
}
