import 'package:dartz/dartz.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';

abstract class LocalSourceImpi {
  Future<Either<ErrorFetch, List<AssessmentModel>>> getLastData();
  Future<Either<ErrorFetch, QuestionModel>> getDetailData({required String id});
  Future<Either<ErrorFetch, dynamic>> insertAllAssesmentDataDB(
      {required List<AssessmentModel> model});
  Future<Either<ErrorFetch, dynamic>> insertDetailAssesmentDataDB(
      {required QuestionModel model});
  Future<Either<ErrorFetch, dynamic>> insertRememberData(
      {required QuestionModel model});
}
