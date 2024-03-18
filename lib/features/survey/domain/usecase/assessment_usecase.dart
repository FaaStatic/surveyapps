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
  Future<Either<ErrorFetch, List<AssessmentModel?>>> getAllAssessment(
      {String page = "1"}) async {
    return await repository.getAllAssessment();
  }

  @override
  Future<Either<ErrorFetch, QuestionModel?>> getDetailQuestion(
      {required String id}) async {
    return await repository.getDetailQuestion(id: id);
  }

  @override
  Future<Either<ErrorFetch, UserLoginModel?>> loginUser(
      {required String name, required String pass}) async {
    return await repository.loginUser(name: name, pass: pass);
  }

  @override
  Future<Either<ErrorFetch, dynamic>> sendAnswer(
      {required AnswerParam sendingData}) async {
    return await repository.sendAnswer(sendingData: sendingData);
  }

  @override
  Future<Either<ErrorFetch, bool>> downloadData(
      {required String id, required String name}) async {
    return await repository.downloadData(id: id, name: name);
  }

  @override
  Future<Either<ErrorFetch, bool>> changeRememberMe(
      {bool change = false, String user = "", String pass = ""}) async {
    return await repository.changeRememberMe(
        change: change, user: user, pass: pass);
  }

  @override
  Future<Either<ErrorFetch, Map<String, dynamic>>> getUserRememberMe() async {
    return await repository.getUserRememberMe();
  }

  @override
  Future<Either<ErrorFetch, bool>> getRememberMe() async {
    return await repository.getRememberMe();
  }
}
