import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/constants.dart';
import 'package:kian_sheeps_projects/core/utlis/styles.dart';

class AskingForLoginOrSignUp extends StatelessWidget {
  const AskingForLoginOrSignUp({
    super.key,
    required this.text,
    required this.questionText,
    required this.onTap,
  });
  final String text;
  final String questionText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(text,
              style: Styles.textstyle16.copyWith(color: kPrimaryColor)),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          questionText,
          style: Styles.textstyle16.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
