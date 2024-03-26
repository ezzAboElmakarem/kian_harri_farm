import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class HomeWelocmeTitle extends StatelessWidget {
  const HomeWelocmeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/welcome_hand.png'),
          SizedBox(
            width: 16.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "welcome_text".tr(),
                style: TextStyles.textstyle20
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "welcome_body_text".tr(),
                style: TextStyles.textstyle14
                    .copyWith(color: ColorStyles.textGreyColor),
              ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
