import 'package:synapsissurvey/core/params/item_choose_param/item_choose_param.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';

abstract class LocalSourceImpi {
  Future<List<AssessmentModel>?> getLastData();
  Future<QuestionModel?> getDetailData(
      {required String id, required int index});
  Future<void> insertAllAssesmentDataDB({required List<AssessmentModel> model});
  Future<void> insertDetailAssesmentDataDB({required QuestionModel model});
  Future<void> insertSavingAnswer(
      {required List<ItemChooseParam> input, required String id});
}
