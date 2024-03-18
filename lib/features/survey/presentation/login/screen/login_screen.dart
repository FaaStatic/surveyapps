import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/util/message/message_util.dart';
import 'package:synapsissurvey/core/util/component/error_page.dart';
import 'package:synapsissurvey/features/survey/presentation/login/component/input_field_custom.dart';
import 'package:synapsissurvey/core/util/component/loading_page.dart';
import 'package:synapsissurvey/features/survey/presentation/login/controller/biometric_check_controller.dart';
import 'package:synapsissurvey/features/survey/presentation/login/controller/login_controller_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/controller/remember_me_controller.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/obsecure_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/pass_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/remember_me_state.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/user_name_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    initDataFirst();
    super.initState();
  }

  Future<void> initDataFirst() async {
    await ref.read(biometricControllerProvider.notifier).biometeriCheck();
    await ref
        .read(rememberMeControllerProvider.notifier)
        .rememberUser()
        .whenComplete(() {
      var dataRemember = ref.read(rememberMeControllerProvider);
      if (dataRemember) {
        print("Login Screen init $dataRemember");
        ref.read(rememberMeControllerProvider.notifier).getUserPass(ref);
        ref.read(providerRememberMeState.notifier).changeRemember(dataRemember);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final biometric = ref.watch(biometricControllerProvider);
    final loginRef = ref.watch(loginControllerProvider);
    print(ref.watch(providerUsername));
    print(ref.watch(providerPass));
    return Scaffold(
        body: SafeArea(
      child: loginRef.when(
        loading: () {
          return const LoadingPage();
        },
        data: (data) {
          return Container(
              width: 100.w,
              height: 100.h,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(kToolbarHeight),
                    Flexible(
                        child: Text(
                      "Login to Synapsis",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                    const Gap(16),
                    Flexible(
                        child: InputFieldCustom(
                            initial: ref.watch(providerUsername),
                            label: "Email",
                            callback: (value) {
                              ref
                                  .read(providerUsername.notifier)
                                  .changeUserName(value);
                            })),
                    const Gap(24),
                    Flexible(
                        child: InputFieldCustom(
                            initial: ref.watch(providerPass),
                            label: "Password",
                            obsecure: true,
                            valueSecure: ref.watch(providerObsecure),
                            callback: (value) {
                              print(value);
                              ref.read(providerPass.notifier).changePass(value);
                            })),
                    const Gap(4),
                    ListTile(
                      horizontalTitleGap: 8,
                      contentPadding: const EdgeInsets.all(0),
                      leading: SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          value: ref.watch(providerRememberMeState),
                          onChanged: (value) {
                            ref
                                .read(providerRememberMeState.notifier)
                                .changeRemember(value!);
                          },
                        ),
                      ),
                      title: Text(
                        "Remember me",
                        style: TextStyle(
                            color: HexColor("#757575"),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    ),
                    const Gap(24),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            minimumSize: Size(100.w, 45),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary),
                        onPressed: () {
                          ref.read(loginControllerProvider.notifier).loginUser(
                              context: context,
                              user: ref.watch(providerUsername),
                              pass: ref.watch(providerPass),
                              remember: ref.watch(providerRememberMeState));
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                    const Gap(16),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Or",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Gap(16),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            minimumSize: Size(100.w, 45),
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          if (biometric.value!) {
                            ref
                                .read(loginControllerProvider.notifier)
                                .loginUser(
                                    context: context,
                                    user: ref.watch(providerUsername),
                                    pass: ref.watch(providerPass),
                                    remember:
                                        ref.watch(providerRememberMeState),
                                    usingBiometric: biometric.value!);
                          } else {
                            MessageUtil().showMessage(
                                100,
                                "Your device nt supported biometric feature",
                                "Biometric error",
                                2);
                          }
                        },
                        child: Text(
                          "Fingerprint",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ));
        },
        error: (error, stackTrace) {
          return ErrorPage(message: error.toString());
        },
      ),
    ));
  }
}
