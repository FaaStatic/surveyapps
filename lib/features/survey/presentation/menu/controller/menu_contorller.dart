import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/di/repository_provider.dart';
import 'package:synapsissurvey/core/util/message/message_util.dart';
import 'package:synapsissurvey/core/util/state/model/state_result.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';

final providerMenu = StateNotifierProvider<MenuController,
        AsyncValue<StateResult<List<AssessmentModel>>>>(
    (ref) => MenuController(usecase: ref.read(repoProvider)));

class MenuController
    extends StateNotifier<AsyncValue<StateResult<List<AssessmentModel>>>> {
  final AssesmentUsecase usecase;
  MenuController({required this.usecase})
      : super(AsyncValue.data(
            StateResult<List<AssessmentModel>>(data: [], hasNextPage: false)));

  Future<void> getListAssessment() async {
    state = const AsyncLoading();
    List<AssessmentModel> temp = [];
    var result = await usecase.getAllAssessment(page: "1");
    print("testing $result");
    result.fold((l) {}, (r) {
      for (var element in r) {
        temp.add(element!);
      }
    });
    state = await AsyncValue.guard(() => Future.value(
        StateResult<List<AssessmentModel>>(
            data: temp, hasNextPage: temp.length == 10 ? true : false)));
  }

  Future<void> getMoreListAssessment(String page) async {
    List<AssessmentModel> temp = [];
    var oldState = state.value;
    var result = await usecase.getAllAssessment(page: page);
    result.fold((l) async {
      state = await AsyncValue.guard(() => Future.value(oldState));
    }, (r) async {
      for (var element in r) {
        temp.add(element!);
      }

      state = await AsyncValue.guard(() => Future.value(state.value!.copyWith(
          data: [...oldState!.data!, ...temp],
          hasNext: temp.length == 10 ? true : false)));
    });
  }

  Future<bool> getDownloadData(String id, String name) async {
    var status = false;
    var download = await usecase.downloadData(id: id, name: name);
    download.fold((l) {
      MessageUtil()
          .showMessage(16, "Download Fail!", "Download Asseessment", 2);
      status = false;
    }, (r) {
      MessageUtil()
          .showMessage(16, "Download Sucessfully!", "Download Asseessment", 1);
      status = r;
    });
    if (status) {
    } else {}
    return status;
  }
}
