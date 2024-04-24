import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class EmptyDataScreen extends StatelessWidget {
  const EmptyDataScreen({
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
        Center(child: Image.asset(AssetsData.noNotificationImage)),
        Text(
          "no_data".tr(),
          style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.w400),
          //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
        ),
      ],
    );
  }
}
