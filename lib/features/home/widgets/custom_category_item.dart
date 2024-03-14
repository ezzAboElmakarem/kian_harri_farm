import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryColor,
    required this.categoryImage,
    required this.categoryName,
  });

  final Color categoryColor;
  final String categoryImage;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: 70.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: categoryColor, borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                height: 40.h,
                width: 40.w,
                child: Image.asset(
                  categoryImage,
                ),
              ),
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            Text(
              categoryName,
              style: TextStyles.textstyle14,
            ),
          ],
        ),
      ),
    );
  }
}
