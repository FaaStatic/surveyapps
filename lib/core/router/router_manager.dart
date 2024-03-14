import 'package:go_router/go_router.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/screen/detail_survey_screen.dart';
import 'package:synapsissurvey/features/survey/presentation/login/screen/login_screen.dart';
import 'package:synapsissurvey/features/survey/presentation/menu/screen/menu_screen.dart';
import 'package:synapsissurvey/features/survey/presentation/splash/screen/splash_screen.dart';

class RouterManager {
  static final RouterManager _main = RouterManager._internal();

  factory RouterManager() {
    return _main;
  }

  RouterManager._internal();

  GoRouter masterRoute = GoRouter(
      initialLocation: "/login",
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) {
              return const SplashScreen();
            }),
        GoRoute(
            path: "/login",
            builder: (context, state) {
              return const LoginScreen();
            }),
        GoRoute(
            path: "/home",
            builder: (context, state) {
              return const MenuScreen();
            }),
        GoRoute(
            path: "/assesment",
            builder: (context, state) {
              final args = state.extra as Map<String, dynamic>;
              return DetailSurveyScreen(id: args["id"] ?? "");
            }),
      ],
      restorationScopeId: "survey_navigate");
}
