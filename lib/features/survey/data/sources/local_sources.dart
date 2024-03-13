import 'package:dartz/dartz.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/impli_case/local_source_impli.dart';

class LocalSources implements LocalSourceImpi {
  @override
  Future<Either<ErrorFetch, QuestionModel>> getDetailData(
      {required String id}) {
    // TODO: implement getDetailData
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, List<AssessmentModel>>> getLastData() {
    // TODO: implement getLastData
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, dynamic>> insertAllAssesmentDataDB(
      {required List<AssessmentModel> model}) {
    // TODO: implement insertAllAssesmentDataDB
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, dynamic>> insertDetailAssesmentDataDB(
      {required QuestionModel model}) {
    // TODO: implement insertDetailAssesmentDataDB
    throw UnimplementedError();
  }
}
