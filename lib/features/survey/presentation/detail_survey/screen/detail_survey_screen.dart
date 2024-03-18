import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/util/component/error_page.dart';
import 'package:synapsissurvey/core/util/component/loading_page.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/component/dialog_container_question.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/component/question_page.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/controller/detail_survey_controller.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/state/state_answer.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/state/state_soal.dart';

class DetailSurveyScreen extends ConsumerStatefulWidget {
  final String id;
  const DetailSurveyScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailSurveyScreenState();
}

class _DetailSurveyScreenState extends ConsumerState<DetailSurveyScreen> {
  final PageController _controlPage = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
    super.initState();
  }

  Future<void> initData() async {
    await ref
        .read(providerSurceyDetail.notifier)
        .getDetail(widget.id, ref)
        .whenComplete(() {
      // ref.read(providerSoalState.notifier).changeListSoal(result!.question!);
    });
    ref.read(providerAnswerState.notifier).initAnswer(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var listing = ref.watch(providerSurceyDetail);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Consumer(builder: (context, ref, _) {
          return listing.when(data: (data) {
            var count = data!.question!.length / 20;

            return Column(
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
                                    return DialogContainerQuestion(
                                      blokCount: count.ceil(),
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
                                  "${_controlPage.page} /$count",
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
                Expanded(
                  child: PageView.builder(
                      controller: _controlPage,
                      itemCount: data.question!.length,
                      itemBuilder: (context, index) {
                        return QuestionPage(
                            data: data.question!.elementAt(index),
                            index: index);
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 55,
                    width: 100.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _controlPage.previousPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn);
                            },
                            child: Text("Back")),
                        ElevatedButton(
                            onPressed: () {
                              _controlPage.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn);
                            },
                            child: Text("Next")),
                      ],
                    ),
                  ),
                )
              ],
            );
          }, error: (err, trace) {
            return ErrorPage(message: err.toString());
          }, loading: () {
            return const LoadingPage();
          });
        }),
      )),
    );
  }
}
