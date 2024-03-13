import "package:dartz/dartz.dart";
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/util/error/error_fetch.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/model/user_login_model/user_login_model.dart';
import 'package:synapsissurvey/features/survey/data/repositories/survey_repositories.dart';

class AssesmentUsecase {
  final SurveyRepositories repository;
  AssesmentUsecase(this.repository);

  Future<Either<ErrorFetch, UserLoginModel>> loginProcess(
      {required String username, required String pass}) async {
    return await repository.loginUser(name: username, pass: pass);
  }

  Future<Either<ErrorFetch, List<AssessmentModel>>> getAllSurvey() async {
    return await repository.getAllAssessment();
  }

  Future<Either<ErrorFetch, QuestionModel>> getQuestionDetail(
      {required String id}) async {
    return await repository.getDetailQuestion(id: id);
  }

  Future<Either<ErrorFetch, dynamic>> sendAnswerSurvey(
      {required AnswerParam param}) async {
    return await repository.sendAnswer(sendingData: param);
  }
}
