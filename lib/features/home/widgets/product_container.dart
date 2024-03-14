import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
              width: 150.w,
              height: 150.h,
              child: Image.asset(AssetsData.meatOffers)),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'اسماك',
            style: TextStyles.textstyle14
                .copyWith(color: ColorStyles.textGreyColor),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'سمك فريش',
            style: TextStyles.textstyle14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.shopping_bag_outlined),
              SizedBox(
                width: 25.w,
              ),
              Text(
                '125 SR',
                style: TextStyles.textstyle14.copyWith(
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                '175 SR',
                style: TextStyles.textstyle14.copyWith(
                    color: ColorStyles.textGreyColor,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
