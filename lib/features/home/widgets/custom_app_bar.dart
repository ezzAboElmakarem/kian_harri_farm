import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/notifications/bloc/notification_bloc.dart';
import 'package:kian_sheeps_projects/features/notifications/views/notifications_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../cart/views/cart_view.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
    required this.scaffoldkey,
  });
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            IconButton(
                icon:
                    Image.asset(AssetsData.menuIcon, height: 28.h, width: 26.w),
                onPressed: () {
                  scaffoldkey.currentState?.openDrawer();
                  log('message');
                }),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  navigateTo(context: context, widget: const CartView());
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 26.h,
                      width: 35.w,
                      child: Image.asset(
                        AssetsData.shoppingBasket,
                        height: 26.h,
                        width: 26.w,
                      ),
                    ),
                    Positioned(
                      left: 18.w,
                      child: CircleAvatar(
                        backgroundColor: ColorStyles.orangeColor,
                        radius: 8.r,
                        child: Text(
                          '2',
                          style: TextStyles.textstyle12
                              .copyWith(color: Colors.white, fontSize: 7.sp),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
                onTap: () {
                  NotificationBloc.get(context).add(Get());
                  RouteUtils.navigateTo(const NotificationView());
                },
                child: Stack(
                  children: [
                    Image.asset(
                      AssetsData.notificationBell,
                      height: 28.h,
                    ),
                    Positioned(
                      left: 8.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 6.r,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight - 4.h);
}
