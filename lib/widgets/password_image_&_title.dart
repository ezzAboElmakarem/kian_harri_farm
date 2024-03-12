import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/styles.dart';

class PasswordImageAndTitle extends StatelessWidget {
  const PasswordImageAndTitle({
    super.key,
    required this.textBody,
  });

  final String textBody;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'نسيت كلمة المرور',
          style: Styles.textstyle20,
        ),
        SizedBox(
          height: 30.h,
        ),
        SvgPicture.asset(AssetsData.forgetPasswordImage,
            width: 327.w, height: 248.h),
        SizedBox(
          height: 16.h,
        ),
        Text(
          textBody,
          style: Styles.textstyle16,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
