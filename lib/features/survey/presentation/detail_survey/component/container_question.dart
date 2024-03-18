import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class ContainerQuestion extends StatelessWidget {
  final int countItem;
  final void Function() callback;
  const ContainerQuestion(
      {super.key, this.countItem = 20, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        ...List.generate(countItem, (index) {
          return Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(width: 1, color: HexColor("#787878"))),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: HexColor("#787878")),
              ),
            ),
          );
        })
      ],
    );
  }
}
