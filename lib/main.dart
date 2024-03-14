import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/constant/constanst.dart';
import 'package:synapsissurvey/core/router/router_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(
    (_) {
      runApp(const ProviderScope(child: MyApp()));
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final scaffolMsgKeyGlobal = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
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
