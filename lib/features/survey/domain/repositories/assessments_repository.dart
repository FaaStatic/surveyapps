import "package:dartz/dartz.dart";
import "package:synapsissurvey/core/params/answer_param/answer_param.dart";
import "package:synapsissurvey/core/util/error/error_fetch.dart";
import "package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart";
import "package:synapsissurvey/features/survey/data/model/question_model/question_model.dart";
import "package:synapsissurvey/features/survey/data/model/user_login_model/user_login_model.dart";

abstract class AssessmentsRepository {
  Future<Either<ErrorFetch, UserLoginModel?>> loginUser(
      {required String name, required String pass});

  Future<Either<ErrorFetch, bool>> downloadData(
      {required String id, required String name});

  Future<Either<ErrorFetch, List<AssessmentModel?>>> getAllAssessment(
      {String page = "1"});

  Future<Either<ErrorFetch, QuestionModel?>> getDetailQuestion(
      {required String id, required int index});

  Future<Either<ErrorFetch, dynamic>> sendAnswer(
      {required AnswerParam sendingData});

  Future<Either<ErrorFetch, bool>> changeRememberMe(
      {bool change = false, String user = "", String pass = ""});
  Future<Either<ErrorFetch, Map<String, dynamic>>> getUserRememberMe();
  Future<Either<ErrorFetch, bool>> getRememberMe();
}
