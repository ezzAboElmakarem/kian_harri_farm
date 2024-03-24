import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/notifications/widgets/notification_card.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.emptyNotification});

  final bool emptyNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'الاشعارات'),
      body: emptyNotification
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Image.asset(AssetsData.noNotificationImage),
                Text('لا توجد اشعارات ابدأ باستخدام التطبيق',
                    style: TextStyles.textstyle16
                        .copyWith(fontWeight: FontWeight.w400),
                    textDirection: TextDirection.rtl),
              ],
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const NotificationCard(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 14.h,
                  ),
              itemCount: 20),
    );
  }
}
