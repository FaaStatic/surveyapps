import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:synapsissurvey/features/survey/presentation/login/state/obsecure_provider.dart';

class InputFieldCustom extends ConsumerStatefulWidget {
  final String label;
  final bool obsecure;
  final String initial;
  final bool valueSecure;
  final void Function(String data) callback;
  const InputFieldCustom(
      {super.key,
      required this.label,
      required this.initial,
      this.obsecure = false,
      this.valueSecure = false,
      required this.callback});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InputFieldCustomState();
}

class _InputFieldCustomState extends ConsumerState<InputFieldCustom> {
  final textController = TextEditingController();
  @override
  void initState() {
    textController.text = widget.initial;
    textController.addListener(() {
      widget.callback(textController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Text(
              widget.label,
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#B9B9B9")),
            ),
          ),
          const Gap(4),
          Container(
            width: 100.w,
            height: 36,
            decoration: BoxDecoration(
                color: HexColor("#FBFBFB"),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: HexColor("#D6E4EC"), width: 1)),
            child: TextFormField(
              obscureText: widget.valueSecure,
              controller: textController,
              obscuringCharacter: "*",
              style: TextStyle(
                  color: HexColor("#757575"),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: widget.obsecure
                    ? IconButton(
                        onPressed: () {
                          ref.read(providerObsecure.notifier).changeObsecures();
                        },
                        icon: ref.watch(providerObsecure)
                            ? Icon(
                                Icons.remove_red_eye,
                                color: HexColor("#9DA7AD"),
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: HexColor("#9DA7AD"),
                              ))
                    : null,
                hintText: widget.label,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                hintStyle: TextStyle(
                    color: HexColor("#757575"),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isCollapsed: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
