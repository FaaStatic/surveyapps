import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/di/repository_provider.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';

final providerSurceyDetail =
    StateNotifierProvider<SurveyDetailController, AsyncValue<QuestionModel?>>(
        (ref) => SurveyDetailController(usecase: ref.read(repoProvider)));

class SurveyDetailController extends StateNotifier<AsyncValue<QuestionModel?>> {
  final AssesmentUsecase usecase;
  SurveyDetailController({required this.usecase})
      : super(const AsyncValue.data(null));

  Future<void> getDetail(String id, WidgetRef ref) async {
    state = const AsyncLoading();
    var result = await usecase.getDetailQuestion(id: id);
    var data = result.fold((l) => l, (r) => r);
    if (result.isRight()) {
      var dataFixed = data as QuestionModel;
      state = await AsyncValue.guard(() => Future.value(dataFixed));
    } else {
      state = await AsyncValue.guard(() => Future.value(null));
    }
  }
}
