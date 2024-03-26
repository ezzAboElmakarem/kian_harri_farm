import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "about_us".tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "about_us_body".tr(),
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "our_vision".tr(),
                style: TextStyles.textstyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "about_us_body".tr(),
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "our_message".tr(),
                style: TextStyles.textstyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "about_us_body".tr(),
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "our_values".tr(),
                style: TextStyles.textstyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "about_us_body".tr(),
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
