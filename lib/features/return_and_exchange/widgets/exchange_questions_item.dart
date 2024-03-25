import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ExchangeQuestionsItem extends StatefulWidget {
  const ExchangeQuestionsItem({super.key});

  @override
  State<ExchangeQuestionsItem> createState() => _ExchangeQuestionsItemState();
}

class _ExchangeQuestionsItemState extends State<ExchangeQuestionsItem> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 22.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimaryColor, width: 2.w)),
      child: InkWell(
        splashColor: Colors.transparent,
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
                  S.of(context).exchange_time,
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
                      S.of(context).exchange_time_anwser,
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
