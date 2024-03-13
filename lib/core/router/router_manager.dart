import 'package:go_router/go_router.dart';

class RouterManager {
  static final RouterManager _main = RouterManager._internal();

  factory RouterManager() {
    return _main;
  }

  RouterManager._internal();

  GoRouter masterRoute = GoRouter(
      initialLocation: "/", routes: [], restorationScopeId: "survey_navigate");
}
