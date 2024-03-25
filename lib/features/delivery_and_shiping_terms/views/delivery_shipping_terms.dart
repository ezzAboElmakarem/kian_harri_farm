import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class DeliveryAndShippingTermsView extends StatelessWidget {
  const DeliveryAndShippingTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, title: S.of(context).shipping_terms),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Text(
                S.of(context).about_us_body,
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                S.of(context).about_us_body,
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                S.of(context).about_us_body,
                style: TextStyles.textstyle16
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.h,
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
