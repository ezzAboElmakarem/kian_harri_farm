import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class OrderPref extends StatelessWidget {
  const OrderPref({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('ملخص الطلب', style: TextStyles.textstyle16),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Text('450.00   LE', style: TextStyles.textstyle14),
            const Spacer(),
            Text('المجموع الفرعى', style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('50.00   LE',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor)),
            const Spacer(),
            Text('الخصم',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor)),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('40.00   LE', style: TextStyles.textstyle14),
            const Spacer(),
            Text('رسوم الخدمة', style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('10.00   LE', style: TextStyles.textstyle14),
            const Spacer(),
            Text('قيمه الضريبه المضافة', style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
            '......................................................................................................................',
            style: TextStyles.textstyle12),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('450.00   LE', style: TextStyles.textstyle14),
            const Spacer(),
            Text('المجموع الكلى', style: TextStyles.textstyle14),
          ],
        ),
      ],
    );
  }
}
