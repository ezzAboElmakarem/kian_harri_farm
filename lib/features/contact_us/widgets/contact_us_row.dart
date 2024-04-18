import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/contact_us/model/contact_us_links_model.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsLinksRow extends StatelessWidget {
  const ContactUsLinksRow({
    super.key,
    required this.linkData,
  });

  final ContacUsLinksModel linkData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        InkWell(
          onTap: () {
            final Uri instaLaunchUri = Uri(
              path: linkData.data?[0].instagram ?? '',
            );

            launchUrl(instaLaunchUri);
          },
          child: Image.asset(
            AssetsData.instaIcon,
            height: 22.h,
            width: 22.w,
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          onTap: () {
            final Uri snapLaunchUri = Uri(
              path: linkData.data?[0].snapchat ?? '',
            );

            launchUrl(snapLaunchUri);
          },
          child: Image.asset(
            AssetsData.snapIcon,
            height: 22.h,
            width: 22.w,
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          onTap: () {
            final Uri webLaunchUri = Uri(
              path: linkData.data?[0].websiteUrl ?? '',
            );

            launchUrl(webLaunchUri);
          },
          child: Image.asset(
            AssetsData.webIcon,
            height: 22.h,
            width: 22.w,
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          onTap: () {
            final Uri twitterLaunchUri = Uri(
              path: linkData.data?[0].twitter ?? '',
            );

            launchUrl(twitterLaunchUri);
          },
          child: Image.asset(
            AssetsData.twitterIcon,
            height: 22.h,
            width: 22.w,
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          onTap: () {
            final Uri facebookLaunchUri = Uri(
              path: linkData.data?[0].facebook ?? '',
            );

            launchUrl(facebookLaunchUri);
            log("$facebookLaunchUri ");
          },
          child: Image.asset(
            AssetsData.facebookIcon,
            height: 22.h,
            width: 22.w,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
