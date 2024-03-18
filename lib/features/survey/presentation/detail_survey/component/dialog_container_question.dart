import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:collection/collection.dart';
import 'package:synapsissurvey/features/survey/data/model/question_model/question_model.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/component/container_question.dart';

class DialogContainerQuestion extends ConsumerStatefulWidget {
  final int blokCount;
  final QuestionModel model;
  final void Function(int index) callback;
  final void Function(int index) callbackGroup;
  const DialogContainerQuestion(
      {super.key,
      this.blokCount = 1,
      this.model = const QuestionModel(),
      required this.callback,
      required this.callbackGroup});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DialogContainerQuestionState();
}

class _DialogContainerQuestionState
    extends ConsumerState<DialogContainerQuestion> {
  PageController _controllerPage = PageController();
  int labelStart = 0;
  List<dynamic> listData = [];

  void listInit() {
    var temp = List.generate(widget.model.question!.length, (index) => index);
    setState(() {
      listData = temp.slices(20).toList();
    });
    print("datanya : $listData");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listInit();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: 100.w,
      height: 60.h,
      color: Colors.black.withOpacity(0.4),
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 100.w,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(kToolbarHeight),
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Survey Question",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: HexColor("#121212"),
                            fontWeight: FontWeight.w500,
                          ),
                        ))),
                const Gap(24),
                Container(
                  width: 100.w,
                  height: 1,
                  color: HexColor("#D9D9D9"),
                ),
                const Gap(24),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 0, top: 0),
                  child: PageView(
                    controller: _controllerPage,
                    onPageChanged: (value) {
                      widget.callbackGroup(value);
                    },
                    children: [
                      if (listData.isNotEmpty)
                        ...List.generate(widget.blokCount, (index) {
                          return ContainerQuestion(
                            countItem: listData.elementAt(index).length,
                            indexLabelStart: listData.elementAt(index).first,
                            callback: (value) {
                              print("clicked on dialog $value");
                              widget.callback(value);
                            },
                          );
                        })
                    ],
                  ),
                )),
                Center(
                  child: SizedBox(
                    height: 25,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          widget.blokCount,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: _controllerPage.hasClients
                                    ? _controllerPage.page == index
                                        ? HexColor("#1FA0C9")
                                        : HexColor("#D9D9D9")
                                    : HexColor("#D9D9D9"),
                                shape: BoxShape.circle),
                            margin: const EdgeInsets.all(4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(24)
              ],
            ),
          )),
    ));
  }
}
