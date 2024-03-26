import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/text_styles.dart';

class DeliveryAndShippingTermsView extends StatelessWidget {
  const DeliveryAndShippingTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "shipping_terms".tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Text(
                "${"about_us_body".tr()}\n \n ${"about_us_body".tr()}",
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
