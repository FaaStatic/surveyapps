import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/di/repository_provider.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';

final providerRemember =
    StateNotifierProvider.autoDispose<RememberMeProvider, bool>(
        (ref) => RememberMeProvider(usecase: ref.read(repoProvider)));

class RememberMeProvider extends StateNotifier<bool> {
  AssesmentUsecase usecase;
  RememberMeProvider({required this.usecase}) : super(false);

  Future<void> changeRemember() async {
    state = !state;
  }

  Future<void> checkRemember() async {}
}
