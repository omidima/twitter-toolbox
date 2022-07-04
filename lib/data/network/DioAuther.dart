import 'package:dio/dio.dart';
import 'package:twitter_tools/twitter.dart';

class DioAuther extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("request: ${options.path} ${options.queryParameters}");
    options.headers['Authorization'] = "Bearer ${TwitterBase.token}";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}