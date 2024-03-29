import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/data/model/item_question_model/item_question_model.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/state/state_answer.dart';

class QuestionPage extends ConsumerStatefulWidget {
  final ItemQuestionModel data;
  final int indexItem;
  const QuestionPage({super.key, required this.data, required this.indexItem});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends ConsumerState<QuestionPage> {
  String tempAnswer = "";
  List<String> tempCheckbox = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAnswerAfter();
    });
    super.initState();
  }

  Future<void> initAnswerAfter() async {
    var result = ref.read(providerAnswerState);
    var fixResult = result.elementAt(widget.indexItem);
    print("test : ${fixResult?.answer}");

    if (widget.data.type == "multiple_choice") {
      setState(() {
        tempAnswer = fixResult?.answer ?? "";
      });
    } else {
      setState(() {
        tempCheckbox =
            fixResult?.answer != null ? fixResult!.answer!.split(",") : [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100.w,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Text(
                  widget.data.section ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 12.sp),
                )),
                const Gap(16),
                Flexible(
                    child: Text(
                  "${(widget.indexItem + 1).toString()}.${widget.data.questionName ?? " "}",
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
          const Gap(16),
          Builder(builder: (context) {
            var listAnswer = widget.data.options;

            return ListView.builder(
                itemCount: listAnswer?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  print("jawaban :  ${listAnswer?.elementAt(index)}");
                  if (widget.data.type == "multiple_choice") {
                    return RadioListTile<String?>(
                        title: Text(
                          listAnswer?.elementAt(index).optionName ?? "",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        value: listAnswer?.elementAt(index).optionid,
                        groupValue: tempAnswer,
                        onChanged: (value) {
                          setState(() {
                            tempAnswer = value!;
                          });

                          ref.read(providerAnswerState.notifier).saveAnswerTemp(
                              widget.indexItem,
                              widget.data.questionId!,
                              value!);
                        });
                  } else {
                    return CheckboxListTile(
                        title: Text(
                          listAnswer?.elementAt(index).optionName ?? "",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        value: tempCheckbox
                            .contains(listAnswer!.elementAt(index).optionid),
                        onChanged: (_) {
                          if (tempCheckbox
                              .contains(listAnswer.elementAt(index).optionid)) {
                            setState(() {
                              tempCheckbox.removeWhere((element) =>
                                  element ==
                                  listAnswer.elementAt(index).optionid);
                            });
                            var answerFix = tempCheckbox.join(",");
                            ref
                                .read(providerAnswerState.notifier)
                                .saveAnswerTemp(widget.indexItem,
                                    widget.data.questionId!, answerFix);
                          } else {
                            setState(() {
                              tempCheckbox
                                  .add(listAnswer.elementAt(index).optionid!);
                            });
                            var answerFix = tempCheckbox.join(",");

                            ref
                                .read(providerAnswerState.notifier)
                                .saveAnswerTemp(widget.indexItem,
                                    widget.data.questionId!, answerFix);
                          }
                        });
                  }
                });
          })
        ],
      ),
    );
  }
}
