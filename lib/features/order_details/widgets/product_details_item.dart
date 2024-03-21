import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('فريش بيف استربس',
                  style: TextStyles.textstyle12
                      .copyWith(color: ColorStyles.textGreyColor),
                  textDirection: TextDirection.rtl),
              SizedBox(
                height: 8.h,
              ),
              Text('الكمية 1',
                  style: TextStyles.textstyle12
                      .copyWith(color: ColorStyles.hintColor.withOpacity(0.4)),
                  textDirection: TextDirection.rtl),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '150.00 SR',
                style: TextStyles.textstyle12
                    .copyWith(color: ColorStyles.hintColor.withOpacity(0.4)),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Container(
          height: 80.h,
          width: 76.w,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AssetsData.productDetails,
                  )),
              borderRadius: BorderRadius.circular(11)),
        ),
      ],
    );
  }
}
