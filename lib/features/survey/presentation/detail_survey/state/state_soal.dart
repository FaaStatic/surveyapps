import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/data/model/item_question_model/item_question_model.dart';

final providerSoalState =
    StateNotifierProvider.autoDispose<StateSoal, List<ItemQuestionModel>>(
        (ref) => StateSoal());

class StateSoal extends StateNotifier<List<ItemQuestionModel>> {
  StateSoal() : super([]);

  void changeListSoal(List<ItemQuestionModel> data) {
    state = data;
  }
}
