import 'package:flutter/material.dart';
import 'package:kian_sheeps_projects/features/notifications/views/empty_notification_view.dart';
import 'package:kian_sheeps_projects/features/notifications/views/notifications_list.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.emptyNotification});

  final bool emptyNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'الاشعارات'),
      body: emptyNotification
          ? const EmptyNotificationView()
          : const Notificationlist(),
    );
  }
}
