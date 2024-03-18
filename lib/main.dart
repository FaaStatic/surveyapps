import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/api/model/api_result/api_result.dart';
import 'package:synapsissurvey/core/constant/constanst.dart';
import 'package:synapsissurvey/core/database/database_manager.dart';
import 'package:synapsissurvey/core/di/router_provider.dart';
import 'package:synapsissurvey/core/di/shared_provider.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    var tableName7 = dotenv.get("TABLE_SAVE_ANSWER");
    print("submit process !");
    var db = await DatabaseManager().openDb();
    var resultDb =
        await db.rawQuery("SELECT * from $tableName7 ORDER BY id_save ASC");

    var path = dotenv.get("SEND_SURVEY");
    List<Map<String, dynamic>> temp = [];

    for (var element in resultDb) {
      var data = {
        "question_id": element["question_id"],
        "answer": element["answer"],
      };
      temp.add(data);
    }
    ;
    var body = {
      {"assessment_id": resultDb.elementAt(0)["id_assessment"], "answers": temp}
    };
    String baseUrl = dotenv.get("BASE_URL");
    var option = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
    );
    var api = Dio(option);
    var result = await api.post("$baseUrl$path", data: body);
    var responseResult = ApiResult.fromJson(result.data);
    if (responseResult.status == 200) {
      db.delete(tableName7, where: 'id = 0');
      db.close();
      return Future.value(responseResult.data);
    } else {
      db.close();
      return Future.value(responseResult.data);
    }
  });
}

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
  Workmanager().registerOneOffTask(
    "com.suhaili.survey_upload",
    "com.suhaili.task_survey",
    initialDelay: const Duration(milliseconds: 10000),
    constraints: Constraints(networkType: NetworkType.connected),
  );
  Workmanager().initialize(callbackDispatcher);
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
              routerConfig: ref.watch(routerProvider),
              scaffoldMessengerKey: scaffolMsgKeyGlobal,
              theme: ThemeData(
                  fontFamily: "Inter",
                  useMaterial3: true,
                  colorScheme: themeDataCustom),
              themeAnimationCurve: Curves.easeIn,
            ));
  }
}
