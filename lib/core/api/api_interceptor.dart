import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = dotenv.get("TOKEN");
    String token_refresh = dotenv.get("REFRESH_TOKEN");
    options.headers["cookie"] = "refresh_token=$token_refresh;token=$token";
    // print("request : ${options.data}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print("response : ${response.data}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("error ${err.error}");
    super.onError(err, handler);
  }
}
