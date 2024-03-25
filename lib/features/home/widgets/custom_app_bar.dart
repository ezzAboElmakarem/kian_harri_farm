import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    required this.scaffoldkey,
  });
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 20.h, top: 8.h),
      child: Row(
        children: [
          IconButton(
              icon: Image.asset(AssetsData.menuIcon, height: 28.h, width: 26.w),
              onPressed: () {
                scaffoldkey.currentState?.openDrawer();
                log('message');
              }),
          const Spacer(),
          GestureDetector(
              onTap: () {},
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
          SizedBox(
            width: 10.w,
          ),
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
        ],
      ),
    );
  }
}
