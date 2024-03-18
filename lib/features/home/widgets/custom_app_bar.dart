import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 20.h, top: 8.h),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Image.asset(
                    AssetsData.notificationBell,
                  ),
                  Positioned(
                    left: 8.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 4.r,
                    ),
                  ),
                ],
              )),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  SizedBox(
                      height: 26.h,
                      width: 26.w,
                      child: Image.asset(AssetsData.shoppingBasket)),
                  Positioned(
                    left: 14.w,
                    child: CircleAvatar(
                      backgroundColor: ColorStyles.orangeColor,
                      radius: 6.r,
                      child: Text(
                        '2',
                        style: TextStyles.textstyle12
                            .copyWith(color: Colors.white, fontSize: 7.sp),
                      ),
                    ),
                  ),
                ],
              )),
          const Spacer(),
          IconButton(
              icon: Image.asset(AssetsData.drawerIcon), onPressed: () {}),
        ],
      ),
    );
  }
}
