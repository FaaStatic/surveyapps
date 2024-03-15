import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synapsissurvey/core/database/database_manager.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/impli_case/local_source_impli.dart';

class DaoDB implements LocalSourceImpi {
  DatabaseManager database;
  DaoDB({required this.database});

  @override
  Future<QuestionModel?> getDetailData({required String id}) async {
    try {
      var tableName = dotenv.get("TABLE_QUESTION");
      var db = await database.openDb();
      var batch = db.batch();
      await batch.commit();
      await db.close();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<AssessmentModel>?> getLastData() async {
    try {
      List<AssessmentModel> temp = [];
      var tableName = dotenv.get("TABLE_ASSESSMENT");
      var db = await database.openDb();
      var batch = db.batch();
      await batch.commit();
      await db.close();
      return temp;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> insertAllAssesmentDataDB(
      {required List<AssessmentModel> model}) async {
    var tableName = dotenv.get("TABLE_ASSESSMENT");
    var tableName2 = dotenv.get("TABLE_PARTICIPANT");
    var db = await database.openDb();
    var batch = db.batch();
    for (var element in model) {
      batch.insert(
          tableName,
          {
            "id": element.id,
            "name": element.name,
            "assessment_date": element.assessementDate,
            "description": element.desc,
            "type": element.type,
            "role_assessor": element.roleAssessor,
            "role_assessor_name": element.roleAssessorName,
            "role_participant": element.roleParticipant,
            "role_participant_name": element.roleAssessorName,
            "departement_id": element.departementId,
            "departement_name": element.departementName,
            "site_location_id": element.siteLocationId,
            "site_location_name": element.siteLocationName,
            "image": element.image,
            "assessors": element.assessors,
            "created_at": element.createdAt,
            "updated_at": element.updatedAt,
            "downloaded_at": element.downloadedAt,
            "has_responses": element.hasResponses! ? 1 : 0
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
      for (var element2 in element.participants!) {
        batch.insert(
            tableName2,
            {
              "id_assessment": element.id,
              "nik": element2.nik,
              "name": element2.name,
              "departement": element2.departement,
              "departement_id": element2.departementId,
              "role": element2.role,
              "role_id": element2.roleId,
              "site_location": element2.siteLocation,
              "site_location_id": element2.siteLocationId,
              "total_assessment": element2.totalAssessment,
              "last_assessment": element2.lastAssessment,
              "image_profile": element2.imageProfile,
              "created_at": element2.createdAt,
            },
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit();
      await db.close();
    }
  }

  @override
  Future<void> insertDetailAssesmentDataDB(
      {required QuestionModel model}) async {
    try {
      var tableName = dotenv.get("TABLE_QUESTION");
      var tableName2 = dotenv.get("TABLE_QUESTION_ITEM");
      var tableName3 = dotenv.get("TABLE_ANSWER_ITEM");
      var db = await database.openDb();
      var batch = db.batch();
      batch.insert(tableName, {"id": model.id, "name": model.name},
          conflictAlgorithm: ConflictAlgorithm.replace);
      for (var element in model.question!) {
        batch.insert(
            tableName2,
            {
              "id_question": model.id,
              "questionid": element.questionId,
              "section": element.section,
              "number": element.number,
              "type": element.type,
              "question_name": element.questionName,
              "scoring": element.scroring! ? 1 : 0,
            },
            conflictAlgorithm: ConflictAlgorithm.replace);
        for (var element2 in element.options!) {
          batch.insert(
              tableName3,
              {
                "question_id": element.questionId,
                "optionid": element2.optionid,
                "option_name": element2.optionName,
                "points": element2.points,
                "flag": element2.flag,
                "site_location_ids": element2.siteLocationIds,
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
      await batch.commit();
      await db.close();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> insertRememberData(
      {required String user, required String pass}) async {
    try {
      var tableName = dotenv.get("TABLE_REMEMBER_ITEM");
      var db = await database.openDb();
      await db.insert(tableName, {"username": user, "pass": pass},
          conflictAlgorithm: ConflictAlgorithm.replace);
      await db.close();
    } catch (e) {
      print(e);
    }
  }
}
