import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  final GoRouter route;
  final SharedPreferences util;

  const ApiInterceptor({required this.route, required this.util});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = dotenv.get("TOKEN");
    String token_refresh = dotenv.get("REFRESH_TOKEN");
    options.headers["cookie"] = "refresh_token=$token_refresh;token=$token";
    print("request Interceptor : ${options.extra}");

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.data["code"] == 401) {
      await util.clear().whenComplete(() {
        route.go("/login");
      });
    }
    print("response : ${response.data}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("error ${err.error}");
    super.onError(err, handler);
  }
}
