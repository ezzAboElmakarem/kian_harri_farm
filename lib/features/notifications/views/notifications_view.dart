import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/notifications/bloc/notification_bloc.dart';
import 'package:kian_sheeps_projects/features/notifications/views/empty_notification_view.dart';
import 'notifications_list.dart';
import '../../../helper/app_bar_method.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'notification'.tr()),
      body: BlocBuilder<NotificationBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_loading_data'.tr()));
          } else if (state is Empty) {
            return const EmptyNotificationView();
          } else {
            return const Notificationlist();
          }
        },
      ),
    );
  }
}

//  emptyNotification
//           ? const EmptyNotificationView()
//           : const Notificationlist(),