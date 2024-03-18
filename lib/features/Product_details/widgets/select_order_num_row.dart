import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SelectOrderNumRow extends StatefulWidget {
  const SelectOrderNumRow({super.key});

  @override
  State<SelectOrderNumRow> createState() => _SelectOrderNumRowState();
}

class _SelectOrderNumRowState extends State<SelectOrderNumRow> {
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
          child: Container(
            height: 40.h,
            width: 32.w,
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                '-',
                style: TextStyles.textstyle20,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          height: 40.h,
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
          child: Container(
            height: 40.h,
            width: 32.w,
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                '+',
                style: TextStyles.textstyle20,
              ),
            ),
          ),
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
