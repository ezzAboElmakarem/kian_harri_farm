import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/contact_us/model/contact_us_links_model.dart';
import 'package:kian_sheeps_projects/features/contact_us/widgets/contact_us_row.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_item.dart';
import '../../../helper/assets.dart';
import '../../../helper/text_styles.dart';

class ContactsShortcuts extends StatelessWidget {
  const ContactsShortcuts({
    super.key,
    required this.linkData,
  });
  final ContacUsLinksModel linkData;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            ContactItemWidget(
              iconUrl: AssetsData.phoneIcon,
              contactText: linkData.data?[0].phone ?? '0147852698',
            ),
            SizedBox(width: 10.w),
            ContactItemWidget(
              iconUrl: AssetsData.locationIcon,
              contactText: linkData.data?[0].address ?? 'الرياض حي التعاون',
            ),
            // const Spacer(),
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: linkData.data?[0].email ?? '',
                );

                launchUrl(emailLaunchUri);
              },
              child: ContactItemWidget(
                iconUrl: AssetsData.emailIcon,
                contactText: linkData.data?[0].email ?? 'info@gmail.com',
              ),
            ),
            // const Spacer(),

            // const Spacer(),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        ContactUsLinksRow(linkData: linkData),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
