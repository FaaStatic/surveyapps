import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synapsissurvey/core/database/database_manager.dart';
import 'package:synapsissurvey/core/params/item_choose_param/item_choose_param.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/data/model/item_answer_model/item_answer_model.dart';
import 'package:synapsissurvey/features/survey/data/model/item_question_model/item_question_model.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/impli_case/local_source_impli.dart';

class DaoDB implements LocalSourceImpi {
  DatabaseManager database;
  DaoDB({required this.database});

  @override
  Future<QuestionModel?> getDetailData(
      {required String id, required int index}) async {
    try {
      List<ItemQuestionModel> listItem = [];
      List<ItemAnswerModel> listAnswer = [];
      var tableQuestion = dotenv.get("TABLE_QUESTION");
      var tableQuestionItem = dotenv.get("TABLE_QUESTION_ITEM");
      var tableAnswerItem = dotenv.get("TABLE_ANSWER_ITEM");
      var db = await database.openDb();
      var question = await db
          .rawQuery("SELECT * FROM $tableQuestion WHERE id LIKE '%$id%'");
      print("datanya dao $question");
      var itemQuestion = await db.rawQuery(
          "SELECT * FROM $tableQuestionItem WHERE id_question LIKE '%$id%'");
      print("datanya dao $itemQuestion");
      for (var element in itemQuestion) {
        var item = await db.rawQuery(
            "SELECT * FROM $tableAnswerItem WHERE question_id LIKE '%${element["questionid"]}%'");
        print("datanya dao $item");
        for (var element2 in item) {
          if (element2["site_location_ids"] != null) {
            var stringToList = element2["site_location_ids"] as String;
            var listIds = stringToList.split(",").toList();
            var input = ItemAnswerModel(
                optionid: element2["optionid"] as String,
                optionName: element2["option_name"] as String,
                points: element2["points"] as int,
                flag: element2["flag"] as int,
                siteLocationIds: listIds);
            listAnswer.add(input);
          } else {
            var input = ItemAnswerModel.fromJson(element2);
            listAnswer.add(input);
          }
        }
        var inputQuestion = ItemQuestionModel(
            questionId: element["questionid"] as String,
            section: element["section"] as String,
            number: element["number"] as String,
            type: element["type"] as String,
            questionName: element["question_name"] as String,
            scroring: element["scoring"] == 1 ? true : false,
            options: listAnswer);

        listItem.add(inputQuestion);
      }
      await db.close();
      return QuestionModel(
          id: question.elementAtOrNull(index)?["id"] as String,
          name: question.elementAtOrNull(index)?["name"] as String,
          question: listItem);
    } catch (e) {
      print("error dao sources : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<List<AssessmentModel>?> getLastData() async {
    try {
      List<AssessmentModel> temp = [];
      var tableName = dotenv.get("TABLE_ASSESSMENT");
      var db = await database.openDb();
      var dataAssesment =
          await db.rawQuery("SELECT * FROM $tableName ORDER BY 'id' ASC");
      print("print data dao getlast : $dataAssesment");
      for (var element in dataAssesment) {
        var input = AssessmentModel(
            id: element["id"].toString(),
            name: element["name"].toString(),
            assessementDate: element["assessment_date"].toString(),
            desc: element["description"].toString(),
            type: element["type"].toString(),
            roleAssessor: element["role_assessor"].toString(),
            roleAssessorName: element["role_assessor_name"].toString(),
            roleParticipant: element["role_participant"],
            roleParticipantName: element["role_participant_name"].toString(),
            departementId: element["departement_id"].toString(),
            departementName: element["departement_name"].toString(),
            siteLocationId: element["site_location_id"].toString(),
            siteLocationName: element["site_location_name"].toString(),
            image: element["image"].toString(),
            assessors: element["assessors"].toString(),
            createdAt: element["created_at"].toString(),
            updatedAt: element["updated_at"].toString(),
            downloadedAt: element["downloaded_at"] as dynamic,
            hasResponses: element["has_responses"] == 1 ? true : false);
        temp.add(input);
      }
      await db.close();
      return temp;
    } catch (e) {
      print("error dao sources : ${e.toString()}");
      return [];
    }
  }

  @override
  Future<void> insertAllAssesmentDataDB(
      {required List<AssessmentModel> model}) async {
    try {
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
    } catch (e) {
      print("error dao sources : ${e.toString()}");
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
          var stringIds = element2.siteLocationIds?.join(",");

          batch.insert(
              tableName3,
              {
                "question_id": element.questionId,
                "optionid": element2.optionid,
                "option_name": element2.optionName,
                "points": element2.points,
                "flag": element2.flag,
                "site_location_ids": stringIds,
              },
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
      await batch.commit();
      await db.close();
    } catch (e) {
      print("error dao sources : ${e.toString()}");
    }
  }

  @override
  Future<void> insertSavingAnswer(
      {required List<ItemChooseParam> input, required String id}) async {
    try {
      var tableSave = dotenv.get("TABLE_SAVE_ANSWER");
      var db = await database.openDb();
      var batch = db.batch();
      for (var element in input) {
        batch.insert(tableSave, {
          "id_assessment": id,
          "question_id": element.questionId,
          "answer": element.answer
        });
      }
      await batch.commit();
      await db.close();
    } catch (e) {
      print("error dao sources : ${e.toString()}");
    }
  }
}
