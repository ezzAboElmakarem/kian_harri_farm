import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'contact_item.dart';
import '../../../helper/assets.dart';
import '../../../helper/text_styles.dart';

class ContactsShortcuts extends StatelessWidget {
  const ContactsShortcuts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 24.h,
        ),
        Text(
          "contuct_us_also".tr(),
          style: TextStyles.textstyle16,
        ),
        SizedBox(
          height: 30.h,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            ContactItemWidget(
              iconUrl: AssetsData.phoneIcon,
              contactText: '0147852698',
            ),
            Spacer(),
            ContactItemWidget(
              iconUrl: AssetsData.emailIcon,
              contactText: 'info@gmail.com',
            ),
            Spacer(),
            ContactItemWidget(
              iconUrl: AssetsData.locationIcon,
              contactText: 'الرياض حي التعاون',
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              AssetsData.instaIcon,
              height: 22.h,
              width: 22.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              AssetsData.snapIcon,
              height: 22.h,
              width: 22.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              AssetsData.webIcon,
              height: 22.h,
              width: 22.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              AssetsData.twitterIcon,
              height: 22.h,
              width: 22.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              AssetsData.facebookIcon,
              height: 22.h,
              width: 22.w,
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
