import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: ColorStyles.greyColor, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      child: Center(
        child: Text(
          'لحوم ',
          style: TextStyles.textstyle14,
        ),
      ),
    );
  }
}
