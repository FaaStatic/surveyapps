import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/params/answer_param/answer_param.dart';
import 'package:synapsissurvey/core/params/item_choose_param/item_choose_param.dart';

final providerAnswerState =
    StateNotifierProvider.autoDispose<StateAnswer, AnswerParam>(
        (ref) => StateAnswer());

class StateAnswer extends StateNotifier<AnswerParam?> {
  StateAnswer() : super(null);

  void changeListSoal(int index, String id, String answer) {
    var oldJawaban = state?.answers;
    if (oldJawaban!.isEmpty) {
      var input = ItemChooseParam(
        questionId: id,
        answer: answer,
      );
      oldJawaban.add(input);
      state = state = state?.copyWith(answers: oldJawaban);
    } else {
      var exist =
          oldJawaban.where((element) => element.questionId == id).toList();
      if (exist.isEmpty) {
        oldJawaban.add(ItemChooseParam(
          questionId: id,
          answer: answer,
        ));

        state = state?.copyWith(answers: oldJawaban);
      } else {
        var index2 =
            oldJawaban.indexWhere((element) => element.questionId == id);
        oldJawaban[index2] = ItemChooseParam(questionId: id, answer: answer);
        state = state?.copyWith(answers: oldJawaban);
      }
    }
  }

  void initAnswer(String assesmentId) {
    state = AnswerParam(assessmentId: assesmentId, answers: []);
  }
}
