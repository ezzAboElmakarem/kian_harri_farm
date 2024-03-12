import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';

class QuestionAndButton extends StatelessWidget {
  const QuestionAndButton({
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
        CustomTextButton(text: text, onTap: onTap),
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
