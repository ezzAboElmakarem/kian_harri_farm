import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/contact_us/widgets/contact_item.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

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
          S.of(context).contuct_us_also,
          style: TextStyles.textstyle16,
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ContactItemWidget(
              iconUrl: AssetsData.phoneIcon,
              contactText: '0147852698',
            ),
            SizedBox(
              width: 30.w,
            ),
            const ContactItemWidget(
              iconUrl: AssetsData.emailIcon,
              contactText: 'info@gmail.com',
            ),
            SizedBox(
              width: 30.w,
            ),
            const ContactItemWidget(
              iconUrl: AssetsData.locationIcon,
              contactText: 'الرياض حي التعاون',
            ),
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
