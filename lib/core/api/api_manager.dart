import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsissurvey/core/api/api_interceptor.dart';

class ApiManager {
  static final ApiManager _main = ApiManager._internal();
  factory ApiManager() {
    return _main;
  }

  ApiManager._internal();

  Dio apiSetup(
    GoRouter route,
    SharedPreferences util,
  ) {
    String baseUrl = dotenv.get("BASE_URL");

    var option = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
    );
    return Dio(option)
      ..interceptors.add(ApiInterceptor(route: route, util: util));
  }
}
