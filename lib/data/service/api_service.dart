abstract class ApiService {
  Future<dynamic> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? params,
  });
}

enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
}
