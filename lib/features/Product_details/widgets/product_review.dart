import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_review_item.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'rating'.tr(),
                style: TextStyles.textstyle16,
              ),
              const Spacer(),
              Text(
                'show_more'.tr(),
                style: TextStyles.textstyle12.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            width: 345,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const ProductReviewItem(),
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemCount: 2),
          ),
        ],
      ),
    );
  }
}
