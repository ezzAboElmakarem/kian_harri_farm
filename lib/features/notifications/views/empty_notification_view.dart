import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class EmptyNotificationView extends StatelessWidget {
  const EmptyNotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
        ),
        Image.asset(AssetsData.noNotificationImage),
        Text(
          'لا توجد اشعارات ابدأ باستخدام التطبيق',
          style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.w400),
          //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
        ),
      ],
    );
  }
}
