import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductType extends StatelessWidget {
  const ProductType({
    super.key,
    required this.productType,
  });

  final String productType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          productType,
          style: TextStyles.textstyle16,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          ': النوع',
          style: TextStyles.textstyle16.copyWith(color: ColorStyles.hintColor),
        ),
      ],
    );
  }
}
