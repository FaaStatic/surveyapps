import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/presentation/login/component/input_field_custom.dart';
import 'package:synapsissurvey/features/survey/presentation/login/controller/login_controller_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/controller/remeber_me_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/obsecure_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/pass_provider.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/user_name_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameVal = ref.read(providerUsername);
    final passVal = ref.read(providerPass);
    return Scaffold(
        body: SafeArea(
      child: Container(
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
                        initial: usernameVal,
                        label: "Email",
                        callback: (value) {
                          ref
                              .read(providerUsername.notifier)
                              .changeUserName(value);
                        })),
                const Gap(24),
                Flexible(
                    child: InputFieldCustom(
                        initial: passVal,
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
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      value: ref.watch(providerRemember),
                      onChanged: (value) {
                        ref.read(providerRemember.notifier).changeRemember();
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
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        minimumSize: Size(100.w, 45),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      //ref.read(loginControllerProvider);
                      context.go("/home");
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
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        minimumSize: Size(100.w, 45),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      ref.read(loginControllerProvider);
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
          )),
    ));
  }
}
