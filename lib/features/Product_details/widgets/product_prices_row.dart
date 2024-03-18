import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductPricesRow extends StatelessWidget {
  const ProductPricesRow({
    super.key,
    required this.productPrice,
    required this.oldProductPrice,
  });

  final int productPrice;
  final int oldProductPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$productPrice SR',
          style: TextStyles.textstyle16.copyWith(color: kPrimaryColor),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          '$oldProductPrice SR',
          style: TextStyles.textstyle14.copyWith(
              color: ColorStyles.textGreyColor.withOpacity(0.5),
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2.0),
        ),
      ],
    );
  }
}
