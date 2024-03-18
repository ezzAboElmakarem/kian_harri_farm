import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.productDescription,
  });
  final String productDescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'الوصف',
          style: TextStyles.textstyle16,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          productDescription,
          textDirection: TextDirection.rtl,
          style: TextStyles.textstyle16.copyWith(
            color: ColorStyles.hintColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
