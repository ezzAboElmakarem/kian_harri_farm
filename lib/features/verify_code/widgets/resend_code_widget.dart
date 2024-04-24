import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/verify_code/verify_code_bloc/verify_code_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ResendWidget extends StatefulWidget {
  const ResendWidget({super.key});

  @override
  State<ResendWidget> createState() => _ResendWidgetState();
}

class _ResendWidgetState extends State<ResendWidget> {
  int counter = 30;
  Timer? timer;

  @override
  void initState() {
    count();
    super.initState();
  }

  void count() {
    counter = 30;
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      setState(() {});
      if (counter == 0) {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    final bloc = VerifyCodeBLoc.get(context);
    bloc.add(ResendCode());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (counter != 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "00:${counter.toString().padLeft(2, '0')}",
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        count();
        resendCode();
      },
      child: Text(
        "send_code".tr(),
        style: TextStyles.textstyle16.copyWith(color: kPrimaryColor),
      ),
    );
  }
}
