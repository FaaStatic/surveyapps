import 'package:dartz/dartz.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';

abstract class RemoteSourceImpli {
  Future<Either<ErrorFetch, List<AssessmentModel>>> getDataAssesmentApi();
  Future<Either<ErrorFetch, QuestionModel>> getDetailAssesmentApi(
      {required String id});
  Future<Either<ErrorFetch, dynamic>> loginAssesmentApi(
      {required String username, required String pass});
  Future<Either<ErrorFetch, dynamic>> sendAssesmentApi(
      {required AnswerParam param});
}
