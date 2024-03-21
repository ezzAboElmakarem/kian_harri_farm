import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class PaymentPref extends StatelessWidget {
  const PaymentPref({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('ملخص الدفع', style: TextStyles.textstyle16),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Divider(
            height: 1.5,
            thickness: 1.5,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
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
            Text('40.00   LE', style: TextStyles.textstyle14),
            const Spacer(),
            Text('رسوم الشحن', style: TextStyles.textstyle14),
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
        Center(
          child: Text(
              '..................................................................................................................',
              style: TextStyles.textstyle12
                  .copyWith(color: ColorStyles.hintColor)),
        ),
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
