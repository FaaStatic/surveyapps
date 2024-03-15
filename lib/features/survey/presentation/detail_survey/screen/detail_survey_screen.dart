import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/component/dialog_container_question.dart';

class DetailSurveyScreen extends ConsumerStatefulWidget {
  final String id;
  const DetailSurveyScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailSurveyScreenState();
}

class _DetailSurveyScreenState extends ConsumerState<DetailSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(24),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1),
                      ),
                      child: Center(
                        child: Text(
                          "45 Second Left",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            backgroundColor: Colors.black,
                            minimumSize: const Size(80, 36)),
                        onPressed: () {
                          showGeneralDialog(
                              context: context,
                              pageBuilder: (context, anim1, anim2) {
                                return const DialogContainerQuestion(
                                  blokCount: 3,
                                );
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.list_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const Gap(8),
                            Text(
                              "1/3",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ))
                  ],
                )),
            const Gap(24),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: Text(
                    "Section B",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 12.sp),
                  )),
                  const Gap(16),
                  Flexible(
                      child: Text(
                    "2.blabalabbalblaba",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor("#787878"),
                        fontSize: 14.sp),
                  ))
                ],
              ),
            ),
            const Gap(24),
            Container(
              width: 100.w,
              height: 16,
              color: HexColor("#EEF6F9"),
            ),
            const Gap(24),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Answer",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 12.sp),
                  )),
            ),
            const Gap(16),
            Container(
              width: 100.w,
              height: 1,
              color: HexColor("#787878"),
            ),
          ],
        ),
      )),
    );
  }
}
