import 'package:dartz/dartz.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/impli_case/remote_source_impli.dart';

class RemoteSources implements RemoteSourceImpli {
  @override
  Future<Either<ErrorFetch, List<AssessmentModel>>> getDataAssesmentApi() {
    // TODO: implement getDataAssesmentApi
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, QuestionModel>> getDetailAssesmentApi(
      {required String id}) {
    // TODO: implement getDetailAssesmentApi
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, dynamic>> loginAssesmentApi(
      {required String username, required String pass}) {
    // TODO: implement loginAssesmentApi
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, dynamic>> sendAssesmentApi(
      {required AnswerParam param}) {
    // TODO: implement sendAssesmentApi
    throw UnimplementedError();
  }
}
