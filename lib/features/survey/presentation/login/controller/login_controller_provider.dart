import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/di/repository_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/pass_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/user_name_provider.dart';

final loginControllerProvider = FutureProvider<dynamic>((ref) async {
  final repository = ref.read(repoProvider);
  var username = ref.read(providerUsername);
  var pass = ref.read(providerPass);

  if (username.isEmpty || pass.isEmpty) {
  } else {
    repository.loginUser(name: username, pass: pass);
  }
});
