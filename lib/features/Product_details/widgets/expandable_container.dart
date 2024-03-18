import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({super.key});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'خدمات أضافية ',
            textDirection: TextDirection.rtl,
            style: TextStyles.textstyle14.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8.h,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              width: 344.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: ColorStyles.greyColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Transform.rotate(
                        angle: 3.14 / 2,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18.sp,
                        )),
                    const Spacer(),
                    Text('(+5\$)',
                        style: TextStyles.textstyle12
                            .copyWith(color: kPrimaryColor)),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'تجريد من العظم',
                      style: TextStyles.textstyle14,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: isExpanded
                ? Curves.fastOutSlowIn
                : Curves.fastLinearToSlowEaseIn,
            width: isExpanded ? 336.w : 0,
            height: isExpanded ? 200.h : 0,
            decoration: BoxDecoration(
              color: ColorStyles.hintColor.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: isExpanded
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                    child: const Text(
                      textDirection: TextDirection.rtl,
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص ',
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
