import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/constant/constanst.dart';
import 'package:synapsissurvey/core/database/database_manager.dart';
import 'package:synapsissurvey/core/router/router_manager.dart';
import 'package:synapsissurvey/core/di/shared_provider.dart';

Future<void> dbChecking() async {
  var status = await DatabaseManager().dbExist();
  if (!status) {
    await DatabaseManager().createAllTable();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await dbChecking();
  final prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(
    (_) {
      runApp(ProviderScope(overrides: [
        providerShared.overrideWithValue(prefs),
      ], child: const MyApp()));
    },
  );
}

final GlobalKey<ScaffoldMessengerState> scaffolMsgKeyGlobal =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Sizer(
        builder: (context, oriented, type) => MaterialApp.router(
              routerConfig: RouterManager().masterRoute,
              scaffoldMessengerKey: scaffolMsgKeyGlobal,
              theme: ThemeData(
                  fontFamily: "Inter",
                  useMaterial3: true,
                  colorScheme: themeDataCustom),
              themeAnimationCurve: Curves.easeIn,
            ));
  }
}
