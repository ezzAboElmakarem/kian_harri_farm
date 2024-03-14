import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/home/widgets/product_container.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductRow extends StatelessWidget {
  const ProductRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'عرض المزيد',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
              ),
              const Spacer(),
              Text(
                'العروض',
                style: TextStyles.textstyle14
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 23.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductContainer(),
              ProductContainer(),
            ],
          ),
        ],
      ),
    );
  }
}
