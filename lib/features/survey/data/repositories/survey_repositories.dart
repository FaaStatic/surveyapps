import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/util/connection/network_info.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/core/util/error/fetch_api_fail.dart';
import 'package:synapsissurvey/core/util/error/fetch_local_fail.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/model/user_login_model/user_login_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/local_sources.dart';
import 'package:synapsissurvey/features/survey/data/sources/remote/remote_sources.dart';
import 'package:synapsissurvey/features/survey/domain/repositories/assessments_repository.dart';

class SurveyRepositories implements AssessmentsRepository {
  final LocalSources localSource;
  final RemoteSources remoteSource;
  final SharedPreferences shared;
  final NetworkInfo info;

  const SurveyRepositories(
      {required this.remoteSource,
      required this.localSource,
      required this.shared,
      required this.info});

  @override
  Future<Either<ErrorFetch, List<AssessmentModel?>>> getAllAssessment(
      {String page = "1"}) async {
    var networkInfo = await NetworkInfo().checkConnectivity();
    if (networkInfo) {
      try {
        var response = await remoteSource.getDataAssesmentApi(page: page);
        return Right(response!);
      } catch (e) {
        return Left(FetchApiFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    } else {
      try {
        var data = await localSource.getLastData();
        return Right(data ?? []);
      } catch (e) {
        return Left(FetchLocalFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    }
  }

  @override
  Future<Either<ErrorFetch, QuestionModel?>> getDetailQuestion(
      {required String id, required int index}) async {
    var networkInfo = await NetworkInfo().checkConnectivity();
    if (networkInfo) {
      try {
        var response = await remoteSource.getDetailAssesmentApi(id: id);
        return Right(response!);
      } catch (e) {
        return Left(FetchApiFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    } else {
      try {
        var data = await localSource.getDetailData(id: id, index: index);
        return Right(data);
      } catch (e) {
        return Left(FetchLocalFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    }
  }

  @override
  Future<Either<ErrorFetch, UserLoginModel?>> loginUser(
      {required String name, required String pass}) async {
    var networkInfo = await NetworkInfo().checkConnectivity();
    if (networkInfo) {
      try {
        var response =
            await remoteSource.loginAssesmentApi(username: name, pass: pass);
        var model = UserLoginModel.fromJson(response);
        return Right(model);
      } catch (e) {
        return Left(FetchApiFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    } else {
      return Left(FetchApiFail(
          errorMessage: "No Internet Connection.", status: 0, dataError: null));
    }
  }

  @override
  Future<Either<ErrorFetch, dynamic>> sendAnswer(
      {required AnswerParam sendingData}) async {
    var networkInfo = await NetworkInfo().checkConnectivity();
    if (networkInfo) {
      try {
        var response = await remoteSource.sendAssesmentApi(param: sendingData);
        return Right(response!);
      } catch (e) {
        return Left(FetchApiFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    } else {
      try {
        await localSource.insertSavingAnswer(
            input: sendingData.answers!, id: sendingData.assessmentId!);
        return const Right("Internet Connecction is lost, the data is save!");
      } catch (e) {
        return Left(FetchLocalFail(
            errorMessage: e.toString(), status: 0, dataError: null));
      }
    }
  }

  @override
  Future<Either<ErrorFetch, bool>> changeRememberMe(
      {bool change = false, String user = "", String pass = ""}) async {
    try {
      var key = dotenv.get("REMEMBER_KEY");
      var keySave = dotenv.get("REMEMBER_KEY_VALUE");
      if (change) {
        Map<String, String> temp = {"user": user, "pass": pass};
        var saveResult = await shared.setString(keySave, jsonEncode(temp));
        var result = await shared.setBool(key, change);
        if (saveResult && result) {
          return Right(result);
        } else {
          return const Right(false);
        }
      } else {
        var saveResult = shared.getString(keySave) ?? "";
        if (saveResult.isEmpty) {
          await shared.setBool(key, change);
          return const Right(false);
        } else {
          await shared.clear();
          await shared.setBool(key, change);
          return const Right(false);
        }
      }
    } catch (e) {
      print("error repositories : ${e.toString()}");
      return Left(FetchLocalFail(
          dataError: false, status: 0, errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<ErrorFetch, bool>> downloadData(
      {required String id, required String name}) async {
    try {
      var dataAssesment =
          await remoteSource.getDataAssesmentApi(page: "1", search: name);
      var result = dataAssesment?.where((element) => element.id == id).toList();
      var resultDetail = await remoteSource.getDetailAssesmentApi(id: id);
      await localSource.insertAllAssesmentDataDB(model: result!);
      await localSource.insertDetailAssesmentDataDB(model: resultDetail!);
      return const Right(true);
    } catch (e) {
      print("error reositories ${e.toString()}");
      return Left(FetchLocalFail(
          errorMessage: e.toString(), status: 100, dataError: false));
    }
  }

  @override
  Future<Either<ErrorFetch, Map<String, dynamic>>> getUserRememberMe() async {
    try {
      var key = dotenv.get("REMEMBER_KEY");
      var keySave = dotenv.get("REMEMBER_KEY_VALUE");
      var status = shared.getBool(key) ?? false;
      if (status) {
        var result = shared.getString(keySave) ?? "";
        if (result.isNotEmpty) {
          var temp = jsonDecode(result);
          return Right(temp);
        } else {
          return Left(FetchLocalFail(
              dataError: {"data": "kosong"},
              status: 0,
              errorMessage: "Nothind Data Save"));
        }
      } else {
        return Left(FetchLocalFail(
            dataError: {"data": "kosong"},
            status: 0,
            errorMessage: "Nothind Data Save"));
      }
    } catch (e) {
      print("error reositories ${e.toString()}");
      return Left(FetchLocalFail(
          dataError: {"data": "kosong"},
          status: 0,
          errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<ErrorFetch, bool>> getRememberMe() async {
    try {
      var key = dotenv.get("REMEMBER_KEY");
      var status = shared.getBool(key) ?? false;
      if (status) {
        return Right(status);
      } else {
        return Right(status);
      }
    } catch (e) {
      print("error reositories ${e.toString()}");
      return Left(FetchLocalFail(
          dataError: false, status: 0, errorMessage: e.toString()));
    }
  }
}
