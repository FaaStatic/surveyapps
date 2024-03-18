import 'package:synapsissurvey/core/params/item_choose_param/item_choose_param.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/dao/dao_db.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/impli_case/local_source_impli.dart';

class LocalSources implements LocalSourceImpi {
  final DaoDB dao;
  const LocalSources({required this.dao});

  @override
  Future<QuestionModel?> getDetailData(
      {required String id, required int index}) async {
    return await dao.getDetailData(id: id, index: index);
  }

  @override
  Future<List<AssessmentModel>?> getLastData() async {
    return await dao.getLastData();
  }

  @override
  Future<void> insertAllAssesmentDataDB(
      {required List<AssessmentModel> model}) async {
    await dao.insertAllAssesmentDataDB(model: model);
  }

  @override
  Future<void> insertDetailAssesmentDataDB(
      {required QuestionModel model}) async {
    await dao.insertDetailAssesmentDataDB(model: model);
  }

  @override
  Future<void> insertSavingAnswer(
      {required List<ItemChooseParam> input, required String id}) async {
    await dao.insertSavingAnswer(input: input, id: id);
  }
}
