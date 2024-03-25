import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: S.of(context).about_us),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).about_us_body,
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                S.of(context).our_vision,
                style: TextStyles.textstyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                S.of(context).about_us_body,
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                S.of(context).our_message,
                style: TextStyles.textstyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                S.of(context).about_us_body,
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                S.of(context).our_values,
                style: TextStyles.textstyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                S.of(context).about_us_body,
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
