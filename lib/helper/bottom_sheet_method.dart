import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> bottomSheetMethod({
  required BuildContext context,
  required Widget bottomSheetContent,
  double? height,
}) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    isScrollControlled: true,
    useRootNavigator: true,
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.all(18.h),
      child: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * .85,
        child: bottomSheetContent,
      ),
    ),
  );
}
