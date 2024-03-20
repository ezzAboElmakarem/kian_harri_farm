import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SelectOrderNum extends StatefulWidget {
  const SelectOrderNum({super.key});

  @override
  State<SelectOrderNum> createState() => _SelectOrderNumState();
}

class _SelectOrderNumState extends State<SelectOrderNum> {
  int numOfOrders = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              if (numOfOrders == 1) {
              } else {
                numOfOrders--;
                setState(() {});
              }
            },
            child: Image.asset(AssetsData.minimizeContainer)),
        SizedBox(
          width: 5.w,
        ),
        Container(
          height: 37.h,
          width: 44.w,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              '$numOfOrders',
              style: TextStyles.textstyle16.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        GestureDetector(
          onTap: () {
            numOfOrders++;
            setState(() {});
          },
          child: Image.asset(AssetsData.maximizeContainer),
        ),
        const Spacer(),
        Text(
          'فريش بيف استربس',
          style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
