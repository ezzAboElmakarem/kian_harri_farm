import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/text_styles.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
    this.categoryName,
  });
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            categoryName ?? 'no category',
            style: TextStyles.textstyle14,
          ),
        ),
      ),
    );
  }
}
