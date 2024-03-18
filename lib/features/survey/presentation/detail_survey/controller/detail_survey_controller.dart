import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:synapsissurvey/core/di/repository_provider.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/params/item_choose_param/item_choose_param.dart';
import 'package:synapsissurvey/core/util/message/message_util.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/state/state_answer.dart';

final providerSurceyDetail =
    StateNotifierProvider<SurveyDetailController, AsyncValue<QuestionModel?>>(
        (ref) => SurveyDetailController(usecase: ref.read(repoProvider)));

class SurveyDetailController extends StateNotifier<AsyncValue<QuestionModel?>> {
  final AssesmentUsecase usecase;
  SurveyDetailController({required this.usecase})
      : super(const AsyncValue.data(null));

  Future<void> getDetail(String id, WidgetRef ref, int index) async {
    state = const AsyncLoading();
    print(id);
    var result = await usecase.getDetailQuestion(id: id, index: index);
    result.fold((l) async {
      print("from survey detail ${l.errorMessage}");
      state = await AsyncValue.guard(() => Future.value(null));
    }, (r) async {
      print("data pertanyaan : ${r?.question}");
      print("banyak pertanyaan : ${r?.question?.length}");
      ref
          .read(providerAnswerState.notifier)
          .initAnswer(r?.question?.length ?? 0);
      state = await AsyncValue.guard(() => Future.value(r));
    });
  }

  Future<void> submitDataToServer(
      WidgetRef ref, String id, BuildContext context) async {
    var tempData = state.value;
    state = const AsyncLoading();
    List<ItemChooseParam> temp = [];
    var answer = ref.read(providerAnswerState);
    for (var element in answer) {
      var input = ItemChooseParam(
          questionId: element?.id ?? "", answer: element?.answer);
      temp.add(input);
    }
    var sendingData = AnswerParam(assessmentId: id, answers: temp);
    var result = await usecase.sendAnswer(sendingData: sendingData);

    result.fold((l) async {
      MessageUtil().showMessage(16, l.errorMessage, "Error Upload", 2);
      state = await AsyncValue.guard((() => Future.value(tempData)));
    }, (r) async {
      ref.invalidate(providerAnswerState);
      MessageUtil()
          .showMessage(16, "Success Submit Answer", "Success Upload", 1);
      context.go("/home");
    });
  }
}
