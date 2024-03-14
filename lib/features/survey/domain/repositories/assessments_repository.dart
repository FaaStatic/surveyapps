import "package:dartz/dartz.dart";
import "package:synapsissurvey/core/params/answer_param/answer_param.dart";
import "package:synapsissurvey/core/util/error/error_fetch.dart";
import "package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart";
import "package:synapsissurvey/features/survey/data/model/question_model/question_model.dart";
import "package:synapsissurvey/features/survey/data/model/user_login_model/user_login_model.dart";

abstract class AssessmentsRepository {
  Future<Either<ErrorFetch, UserLoginModel>> loginUser(
      {required String name, required String pass});

  Future<Either<ErrorFetch, List<AssessmentModel>>> getAllAssessment();

  Future<Either<ErrorFetch, QuestionModel>> getDetailQuestion(
      {required String id});

  Future<Either<ErrorFetch, dynamic>> sendAnswer(
      {required AnswerParam sendingData});

  Future<Either<ErrorFetch, dynamic>> rememberMe(
      {required String name, required String pass});

  Future<Either<ErrorFetch, bool>> checkRememberMe();
}
