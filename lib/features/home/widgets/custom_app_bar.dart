import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: const Icon(
              Icons.notifications_none,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.shopping_bag_outlined,
            ),
          ),
          const Spacer(),
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
    );
  }
}
