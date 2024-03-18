import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class UserReviewContainer extends StatelessWidget {
  const UserReviewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      child: Container(
        width: 340.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.5,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '2023 / 6 / 1',
                    style: TextStyles.textstyle12.copyWith(
                      color: ColorStyles.textGreyColor.withOpacity(0.6),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'منال الخالدي',
                        style: TextStyles.textstyle16,
                      ),
                      Row(
                        children: [
                          Text('4.5 ',
                              style: TextStyles.textstyle14.copyWith(
                                  color: ColorStyles.starRatingColor)),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 18.sp,
                            color: ColorStyles.starRatingColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  SizedBox(
                      height: 44.h,
                      width: 38.w,
                      child: Image.asset(
                        AssetsData.userPic,
                        fit: BoxFit.contain,
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص ',
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.textstyle14
                      .copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
