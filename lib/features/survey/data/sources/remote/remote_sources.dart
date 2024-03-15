import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:synapsissurvey/core/api/model/api_result/api_result.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/remote/impli_case/remote_source_impli.dart';

class RemoteSources implements RemoteSourceImpli {
  final Dio api;
  const RemoteSources({required this.api});

  @override
  Future<List<AssessmentModel>?> getDataAssesmentApi() async {
    try {
      var path = dotenv.get("ALL-SURVEY");
      var result = await api.get("$path/?page=1&limit=10");
      var responseResult =
          ApiResult<List<AssessmentModel>>.fromJson(result.data);
      if (responseResult.status == 200) {
        return responseResult.data;
      } else {
        return responseResult.data;
      }
    } on DioException catch (e) {
      return [];
    }
  }

  @override
  Future<QuestionModel?> getDetailAssesmentApi({required String id}) async {
    try {
      var path = dotenv.get("DETAIL_SURVEY");
      var result = await api.get("$path/$id");
      var responseResult = ApiResult<QuestionModel>.fromJson(result.data);
      return responseResult.data;
    } on DioException catch (e) {
      return null;
    }
  }

  @override
  Future<List<AssessmentModel>?> getMoreDataAssesmentApi(
      {required String page}) async {
    try {
      var path = dotenv.get("ALL-SURVEY");
      var result = await api.get("$path/?page=$page&limit=10");
      var responseResult =
          ApiResult<List<AssessmentModel>>.fromJson(result.data);
      if (responseResult.status == 200) {
        return responseResult.data;
      } else {
        return responseResult.data;
      }
    } on DioException catch (e) {
      return [];
    }
  }

  @override
  Future loginAssesmentApi(
      {required String username, required String pass}) async {
    var path = dotenv.get("LOGIN_USER");
    var body = {"nik": username, "password": pass};
    var result = await api.post(path, data: body);
    var responseResult = ApiResult.fromJson(result.data);
    if (responseResult.status == 200) {
      return responseResult.data;
    } else {
      return responseResult.data;
    }
  }

  @override
  Future sendAssesmentApi({required AnswerParam param}) async {
    var path = dotenv.get("SEND_SURVEY");
    List<Map<String, dynamic>> temp = [];

    for (var element in param.answers!) {
      var data = {
        "question_id": element.questionId,
        "answer": element.answer // Type Multiple Choice
      };
      temp.add(data);
    }
    ;
    var body = {
      {"assessment_id": param.assessmentId, "answers": temp}
    };
    var result = await api.post(path, data: body);
    var responseResult = ApiResult.fromJson(result.data);
    if (responseResult.status == 200) {
      return responseResult.data;
    } else {
      return responseResult.data;
    }
  }
}
