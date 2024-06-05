import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final void Function(Object object) logPrint;

  DioInterceptor({this.logPrint = print});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logPrint('*** Request ***');
    _printKV('uri', options.uri);

    _printKV('method', options.method);
    _printKV('responseType', options.responseType.toString());
    _printKV('followRedirects', options.followRedirects);
    _printKV('connectTimeout', options.connectTimeout);
    _printKV('sendTimeout', options.sendTimeout);
    _printKV('receiveTimeout', options.receiveTimeout);
    _printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError);
    _printKV('extra', options.extra);

    logPrint('headers:');
    options.headers.forEach((key, v) => _printKV('  $key', v));

    var data = options.data;
    logPrint('data:');
    if (data is FormData) {
      for (var element in data.fields) {
        _printKV('  ${element.key}', element.value);
      }
      logPrint('files:');
      for (var element in data.files) {
        _printKV('  ${element.key}', element.value.filename);
      }
    } else {
      _printAll(data);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('*** Response ***');
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint('*** DioError ***:');
    logPrint('uri: ${err.requestOptions.uri}');
    logPrint('error: $err');

    if (err.response != null) {
      _printResponse(err.response!);
    }

    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    _printKV('statusCode', response.statusCode);

    if (response.isRedirect == true) {
      _printKV('redirect', response.realUri);
    }

    logPrint('headers:');
    response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));

    logPrint('Response Text:');
    _printAll(response.toString());
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}
