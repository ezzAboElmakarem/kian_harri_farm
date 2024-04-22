import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/color_styles.dart';
import '../helper/text_styles.dart';

class QuestionsItem extends StatefulWidget {
  const QuestionsItem(
      {super.key, required this.question, required this.answer});
  final String question, answer;
  @override
  State<QuestionsItem> createState() => _QuestionsItemState();
}

class _QuestionsItemState extends State<QuestionsItem> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 22.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimaryColor, width: 2.w)),
      child: GestureDetector(
        // splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  widget.answer,
                  style: TextStyles.textstyle16
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Transform.rotate(
                    angle: 3.14 / 2,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                    )),
              ],
            ),
            isPressed
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
                    child: Text(
                      widget.question,
                      style: TextStyles.textstyle16
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  )
                : SizedBox(height: 0.h),
          ],
        ),
      ),
    );
  }
}
