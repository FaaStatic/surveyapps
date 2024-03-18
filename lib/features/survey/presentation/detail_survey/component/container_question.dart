import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:collection/collection.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/presentation/detail_survey/state/state_answer.dart';

class ContainerQuestion extends ConsumerWidget {
  final int countItem;
  final int indexLabelStart;
  final void Function(int value) callback;

  const ContainerQuestion({
    super.key,
    this.countItem = 20,
    required this.indexLabelStart,
    required this.callback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        ...List.generate(countItem, (index) {
          var isAnswerItem =
              ref.watch(providerAnswerState).elementAt(index) == null
                  ? false
                  : ref.watch(providerAnswerState).elementAt(index)?.isAnswer ??
                      false;
          var isActive = ref.watch(providerAnswerState).elementAt(index) == null
              ? false
              : ref.watch(providerAnswerState).elementAt(index)?.isActive ??
                  false;
          return GestureDetector(
            onTap: () {
              callback(index);
              context.pop();
            },
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  color: isAnswerItem
                      ? Theme.of(context).colorScheme.primary
                      : isActive && isAnswerItem
                          ? HexColor("#1FA0C933")
                          : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(
                      width: 1,
                      color: isActive
                          ? Theme.of(context).colorScheme.primary
                          : HexColor("#787878"))),
              child: Center(
                child: Text(
                  ((indexLabelStart + index) + 1).toString(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isAnswerItem
                          ? Colors.white
                          : isActive && isAnswerItem
                              ? Theme.of(context).colorScheme.primary
                              : HexColor("#787878")),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
