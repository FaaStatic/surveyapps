import 'package:dartz/dartz.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/util/connection/network_info.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/model/user_login_model/user_login_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/local_sources.dart';
import 'package:synapsissurvey/features/survey/data/sources/remote_sources.dart';
import 'package:synapsissurvey/features/survey/domain/repositories/assessments_repository.dart';

class SurveyRepositories implements AssessmentsRepository {
  final LocalSources localSource;
  final RemoteSources remoteSource;
  final NetworkInfo info;

  const SurveyRepositories(
      {required this.remoteSource,
      required this.localSource,
      required this.info});

  @override
  Future<Either<ErrorFetch, List<AssessmentModel>>> getAllAssessment() {
    // TODO: implement getAllAssessment
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, QuestionModel>> getDetailQuestion(
      {required String id}) {
    // TODO: implement getDetailQuestion
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, UserLoginModel>> loginUser(
      {required String name, required String pass}) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, dynamic>> sendAnswer(
      {required AnswerParam sendingData}) {
    // TODO: implement sendAnswer
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, dynamic>> rememberMe(
      {required String name, required String pass}) {
    // TODO: implement rememberMe
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorFetch, bool>> checkRememberMe() {
    // TODO: implement checkRememberMe
    throw UnimplementedError();
  }
}
