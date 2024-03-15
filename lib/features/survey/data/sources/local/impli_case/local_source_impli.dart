import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';

abstract class LocalSourceImpi {
  Future<List<AssessmentModel>?> getLastData();
  Future<QuestionModel?> getDetailData({required String id});
  Future<void> insertAllAssesmentDataDB({required List<AssessmentModel> model});
  Future<void> insertDetailAssesmentDataDB({required QuestionModel model});
  Future<void> insertRememberData({required String user, required String pass});
}
