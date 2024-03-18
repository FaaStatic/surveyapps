import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/presentation/splash/controller/splash_constroller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  Future<void> nextPage(WidgetRef ref) async {
    var result = await ref.read(splashProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    nextPage(ref);
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_img.png",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            const Gap(16),
            Text(
              "Synapsis Survey Apps",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
      ),
    );
  }
}
