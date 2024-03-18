import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/util/model_state/model/temp_answer.dart';
import 'package:collection/collection.dart';

final providerAnswerState =
    StateNotifierProvider<StateAnswer, List<TempAnswer?>>(
        (ref) => StateAnswer());

class StateAnswer extends StateNotifier<List<TempAnswer?>> {
  StateAnswer() : super([]);

  void saveAnswerTemp(int index, String id, String answer) {
    var oldJawaban = state;
    oldJawaban[index] = TempAnswer(
        id: id,
        answer: answer,
        isAnswer: true,
        isActive: oldJawaban[index]?.isActive ?? false);
    state = oldJawaban;
    print(state);
  }

  void nextPage(int previous, int index) {
    var oldJawaban = state;
    oldJawaban[previous] = TempAnswer(
        isActive: false,
        isAnswer: oldJawaban[previous]!.isAnswer,
        id: oldJawaban[previous]?.id,
        answer: oldJawaban[previous]?.answer);
    if (oldJawaban[index] == null) {
      oldJawaban[index] = const TempAnswer(
          isActive: true, isAnswer: false, id: null, answer: null);
      state = oldJawaban;
    } else {
      oldJawaban[index] = TempAnswer(
          isActive: true,
          isAnswer: oldJawaban[index]?.isAnswer,
          id: oldJawaban[index]?.id,
          answer: oldJawaban[index]?.answer);
      state = oldJawaban;
    }
  }

  void initAnswer(int count) {
    print("banyak list : $count");
    List<TempAnswer> temp = [];
    int index = 0;
    while (index < count) {
      if (index == 0) {
        temp.add(const TempAnswer(
            isActive: true, isAnswer: false, id: null, answer: null));
      } else {
        temp.add(const TempAnswer(
            isActive: false, isAnswer: false, id: null, answer: null));
      }
      index++;
    }

    print("hasil init : $temp");
    state.addAll(temp);
  }
}
