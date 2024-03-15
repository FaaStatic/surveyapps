import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/data/model/assessment_model/assessment_model.dart';

class ItemListSurvey extends StatelessWidget {
  final AssessmentModel result;
  final void Function() callback;
  final void Function() callbackDownload;

  const ItemListSurvey(
      {super.key,
      required this.result,
      required this.callback,
      required this.callbackDownload});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        behavior: HitTestBehavior.translucent,
        child: Card(
          margin: const EdgeInsets.only(bottom: 8),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: HexColor("#D9D9D9")),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          shadowColor: HexColor("#D9D9D9"),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icon/ic_exam.svg",
                        color: Theme.of(context).colorScheme.primary,
                        width: 55,
                        height: 55,
                        fit: BoxFit.fill,
                      ),
                      const Gap(16),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            result.name ?? "...",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const Gap(8),
                          Text(
                            "Created At: ${DateFormat("dd MMM yyyy").format(result.createdAt != null ? DateTime.parse(result.createdAt!) : DateTime.now())}",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: HexColor("#107C41")),
                          ),
                          const Gap(8),
                          Text(
                            "Last Download: ${result.downloadedAt != null ? DateFormat("dd MM yyyy").format(DateTime.parse(result.downloadedAt!)) : "-"}",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: HexColor("#107C41")),
                          ),
                          const Gap(8),
                        ],
                      ))
                    ],
                  )),
                  IconButton(
                      onPressed: callbackDownload,
                      icon: const Icon(
                        Icons.file_download_outlined,
                        size: 28,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
