import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:synapsissurvey/core/di/biomtric_provider.dart';
import 'package:synapsissurvey/core/di/repository_provider.dart';
import 'package:synapsissurvey/core/util/message/message_util.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<dynamic>>((ref) =>
        LoginController(
            usecase: ref.read(repoProvider),
            auth: ref.read(biometricProvider)));

class LoginController extends StateNotifier<AsyncValue<dynamic>> {
  final AssesmentUsecase usecase;
  final LocalAuthentication auth;
  LoginController({required this.usecase, required this.auth})
      : super(const AsyncData(null));

  Future<void> loginUser(
      {String user = "",
      String pass = "",
      bool remember = false,
      bool usingBiometric = false,
      required BuildContext context}) async {
    state = const AsyncLoading();
    if (usingBiometric) {
      var status = await auth.authenticate(
          localizedReason: "Please authenticate for login user",
          authMessages: [
            const AndroidAuthMessages(
              signInTitle: 'You can authencticate to login the app',
              cancelButton: 'No thanks',
            ),
            const IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ],
          options: const AuthenticationOptions(biometricOnly: true));
      if (status) {
        var result = await usecase.changeRememberMe(
            change: remember, user: user, pass: pass);
        print("from login Controller result $result");
        var data = await usecase.loginUser(name: user, pass: pass);
        print(data);
        if (data.isRight()) {
          await MessageUtil()
              .showMessage(100, "Login Successfully", "Success", 1)
              .whenComplete(() {
            context.go("/home");
          });
        } else {
          await MessageUtil().showMessage(100, "Login Fail", "Fail", 2);
          state = await AsyncValue.guard(() => Future.value(true));
        }
      } else {
        await MessageUtil().showMessage(100, "Login Fail", "Fail", 2);
        state = await AsyncValue.guard(() => Future.value(true));
      }
    } else {
      var result = await usecase.changeRememberMe(
          change: remember, user: user, pass: pass);
      print("from login Controller result $result");
      var data = await usecase.loginUser(name: user, pass: pass);
      print(data);
      if (data.isRight()) {
        await MessageUtil()
            .showMessage(100, "Login Successfully", "Success", 1)
            .whenComplete(() {
          context.go("/home");
        });
      } else {
        await MessageUtil().showMessage(100, "Login Fail", "Fail", 2);
        state = await AsyncValue.guard(() => Future.value(true));
      }
    }
  }
}
