import "package:dartz/dartz.dart";
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/model/user_login_model/user_login_model.dart';
import 'package:synapsissurvey/features/survey/data/repositories/survey_repositories.dart';
import 'package:synapsissurvey/features/survey/domain/repositories/assessments_repository.dart';

class AssesmentUsecase implements AssessmentsRepository {
  final SurveyRepositories repository;
  AssesmentUsecase(this.repository);

  @override
  Future<Either<ErrorFetch, List<AssessmentModel>>> getAllAssessment() async {
    return await repository.getAllAssessment();
  }

  @override
  Future<Either<ErrorFetch, QuestionModel>> getDetailQuestion(
      {required String id}) async {
    return await repository.getDetailQuestion(id: id);
  }

  @override
  Future<Either<ErrorFetch, UserLoginModel>> loginUser(
      {required String name, required String pass}) async {
    return await repository.loginUser(name: name, pass: pass);
  }

  @override
  Future<Either<ErrorFetch, dynamic>> sendAnswer(
      {required AnswerParam sendingData}) async {
    return repository.sendAnswer(sendingData: sendingData);
  }

  @override
  Future<Either<ErrorFetch, dynamic>> rememberMe(
      {required String name, required String pass}) async {
    return repository.rememberMe(name: name, pass: pass);
  }

  @override
  Future<Either<ErrorFetch, bool>> checkRememberMe() {
    // TODO: implement checkRememberMe
    throw UnimplementedError();
  }
}
