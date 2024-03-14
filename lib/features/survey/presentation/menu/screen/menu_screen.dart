import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';
import 'package:synapsissurvey/features/survey/presentation/menu/component/item_list_survey.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(kToolbarHeight),
            Text(
              "Halaman Assessment",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const Gap(24),
            Expanded(
                child: ListView(
              children: [
                ItemListSurvey(
                    result: const AssessmentModel(),
                    callback: () {
                      context.push("/assesment", extra: {"id": null});
                    },
                    callbackDownload: () {})
              ],
            ))
          ],
        ),
      )),
    );
  }
}
