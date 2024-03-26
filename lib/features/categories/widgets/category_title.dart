import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/text_styles.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'لحوم',
            style: TextStyles.textstyle14,
          ),
        ),
      ),
    );
  }
}
