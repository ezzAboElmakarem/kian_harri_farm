import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification_card.dart';

class Notificationlist extends StatelessWidget {
  const Notificationlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const NotificationCard(),
        separatorBuilder: (context, index) => SizedBox(
              height: 14.h,
            ),
        itemCount: 20);
  }
}
