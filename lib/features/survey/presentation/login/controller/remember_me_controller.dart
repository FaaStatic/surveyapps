import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/di/repository_provider.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/pass_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/user_name_provider.dart';

final rememberMeControllerProvider =
    StateNotifierProvider<LoginController, bool>(
        (ref) => LoginController(usecase: ref.read(repoProvider)));

class LoginController extends StateNotifier<bool> {
  final AssesmentUsecase usecase;
  LoginController({required this.usecase}) : super(false);

  Future<void> rememberUser() async {
    var result = await usecase.getRememberMe();
    result.fold((l) {
      if (result.isLeft()) {
        state = false;
      }
    }, (r) {
      if (result.isRight()) {
        state = r;
      }
    });
  }

  Future<void> getUserPass(WidgetRef ref) async {
    var result = await usecase.getUserRememberMe();
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        ref.read(providerUsername.notifier).changeUserName(r["user"]);
        ref.read(providerPass.notifier).changePass(r["pass"]);
      });
    } else {
      result.fold((l) {
        state = false;
      }, (r) {});
    }
  }
}
