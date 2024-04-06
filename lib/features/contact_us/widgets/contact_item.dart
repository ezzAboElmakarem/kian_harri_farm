import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/text_styles.dart';

class ContactItemWidget extends StatelessWidget {
  const ContactItemWidget({
    super.key,
    required this.iconUrl,
    required this.contactText,
  });
  final String iconUrl;
  final String contactText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconUrl,
          height: 22.h,
          width: 22.w,
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          contactText,
          style: TextStyles.textstyle12.copyWith(fontSize: 10.sp),
        )
      ],
    );
  }
}
