import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_styles.dart';

AppBar customAppBar(
    {required BuildContext context, Widget? leading, required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 24.sp,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.textstyle14.copyWith(fontWeight: FontWeight.w600),
    ),
    actions: const [],
  );
}
