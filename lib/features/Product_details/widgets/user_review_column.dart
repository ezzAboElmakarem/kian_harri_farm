import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/widgets/user_review_item_container.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class UserReviewColumn extends StatelessWidget {
  const UserReviewColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'عرض الكل',
              style: TextStyles.textstyle12
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              'التقيمات',
              style: TextStyles.textstyle16,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 340.h,
          width: 345,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const UserReviewContainer(),
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
              itemCount: 2),
        ),
      ],
    );
  }
}
