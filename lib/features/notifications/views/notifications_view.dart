import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'empty_notification_view.dart';
import 'notifications_list.dart';
import '../../../helper/app_bar_method.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.emptyNotification});

  final bool emptyNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'notification'.tr()),
      body: emptyNotification
          ? const EmptyNotificationView()
          : const Notificationlist(),
    );
  }
}
