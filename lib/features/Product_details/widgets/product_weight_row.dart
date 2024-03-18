import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductWeight extends StatelessWidget {
  const ProductWeight({
    super.key,
    required this.productWeight,
  });

  final int productWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$productWeight كيلو ',
          style: TextStyles.textstyle16,
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          ': الوزن التقريبي',
          style: TextStyles.textstyle16.copyWith(color: ColorStyles.hintColor),
        ),
      ],
    );
  }
}
