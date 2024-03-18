import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:collection/collection.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/core/util/component/error_page.dart';
import 'package:synapsissurvey/core/util/component/loading_page.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/component/dialog_container_question.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/component/question_page.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/controller/detail_survey_controller.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/state/state_answer.dart';

class DetailSurveyScreen extends ConsumerStatefulWidget {
  final String id;
  final int index;
  const DetailSurveyScreen({super.key, required this.id, required this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailSurveyScreenState();
}

class _DetailSurveyScreenState extends ConsumerState<DetailSurveyScreen> {
  final PageController _controlPage = PageController();
  int _secondSoal = 3600;
  Timer? _timer;
  int soalGroup = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
    super.initState();
  }

  Future<void> initData() async {
    startTimer();
    await ref
        .read(providerSurceyDetail.notifier)
        .getDetail(widget.id, ref, widget.index);
  }

  Future<void> startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondSoal == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _secondSoal -= 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _controlPage.dispose();
    _timer?.cancel();
    super.dispose();
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
            if (data != null) {
              var listItem = data.question!.slices(20).toList();
              var count = listItem.length;

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
                                "$_secondSoal Second Left",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                                        callbackGroup: (value) {
                                          setState(() {
                                            soalGroup = value;
                                          });
                                        },
                                        model: data,
                                        callback: (value) {
                                          print("clicked on page main $value");
                                          var previous =
                                              _controlPage.page!.toInt();
                                          _controlPage.jumpToPage(value);
                                          ref
                                              .read(
                                                  providerAnswerState.notifier)
                                              .nextPage(previous, value);
                                        },
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
                                    "$soalGroup/$count",
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
                              indexItem: index);
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
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(45.w, 45),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                  )),
                              onPressed: () {
                                var previous = _controlPage.page!.toInt();
                                _controlPage
                                    .previousPage(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.easeIn)
                                    .then((_) {
                                  ref
                                      .read(providerAnswerState.notifier)
                                      .nextPage(
                                        previous,
                                        _controlPage.page!.toInt(),
                                      );
                                });
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w400),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  minimumSize: Size(45.w, 45),
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  )),
                              onPressed: () {
                                if (_controlPage.page !=
                                    (data.question!.length - 1)) {
                                  var previous = _controlPage.page!.toInt();
                                  _controlPage
                                      .nextPage(
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.easeIn)
                                      .then((_) {
                                    ref
                                        .read(providerAnswerState.notifier)
                                        .nextPage(previous,
                                            _controlPage.page!.toInt());
                                  });
                                } else {
                                  ref
                                      .read(providerSurceyDetail.notifier)
                                      .submitDataToServer(
                                          ref, data.id ?? "", context);
                                }
                              },
                              child: Text(
                                _controlPage.hasClients
                                    ? _controlPage.page ==
                                            (data.question!.length - 1)
                                        ? "Submit"
                                        : "Next"
                                    : "Next",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              );
            } else {
              return const ErrorPage(message: "Problem fetchData!");
            }
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
