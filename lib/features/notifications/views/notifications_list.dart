import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/notifications/bloc/notification_bloc.dart';
import '../widgets/notification_card.dart';

class Notificationlist extends StatelessWidget {
  const Notificationlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = NotificationBloc.get(context);
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => NotificationCard(
              title: bloc.data.data![index].title!,
              dateTime: bloc.data.data![index].createdAt!,
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: 14.h,
            ),
        itemCount: bloc.data.data!.length);
  }
}
