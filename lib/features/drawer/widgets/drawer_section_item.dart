import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class DrawerSectionItem extends StatelessWidget {
  const DrawerSectionItem(
      {super.key,
      required this.sectionTitle,
      required this.sectionIcon,
      required this.widget,
      required this.navigationButton});
  final String sectionTitle;
  final String sectionIcon;
  final Widget widget;
  final bool navigationButton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            navigationButton
                ? Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20.sp,
                  )
                : Text(' '),
            const Spacer(),
            Text(
              sectionTitle,
              style: TextStyles.textstyle14,
            ),
            SizedBox(
              width: 8.w,
            ),
            Image.asset(
              sectionIcon,
              height: 24.h,
              width: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
