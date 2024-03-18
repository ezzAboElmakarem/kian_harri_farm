import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

AppBar customAppBar(
    {required BuildContext context, Widget? leading, required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: leading,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.w600),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20.sp,
          ),
        ),
      ),
    ],
  );
}
