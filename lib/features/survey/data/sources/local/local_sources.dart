import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/dao/dao_db.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/impli_case/local_source_impli.dart';

class LocalSources implements LocalSourceImpi {
  final DaoDB dao;
  const LocalSources({required this.dao});

  @override
  Future<QuestionModel?> getDetailData({required String id}) async {
    return await dao.getDetailData(id: id);
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
  Future<void> insertRememberData(
      {required String user, required String pass}) async {
    await dao.insertRememberData(user: user, pass: pass);
  }
}
