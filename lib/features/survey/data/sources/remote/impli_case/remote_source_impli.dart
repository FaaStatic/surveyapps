import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';

abstract class RemoteSourceImpli {
  Future<List<AssessmentModel>?> getDataAssesmentApi(
      {String page = "1", String search = ""});
  Future<bool> downloadAssessment();
  Future<QuestionModel?> getDetailAssesmentApi({required String id});
  Future<dynamic> loginAssesmentApi(
      {required String username, required String pass});
  Future<dynamic> sendAssesmentApi({required AnswerParam param});
}
