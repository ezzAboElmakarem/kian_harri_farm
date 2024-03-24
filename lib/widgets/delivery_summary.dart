import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class DeliverySummary extends StatelessWidget {
  const DeliverySummary({
    required this.isEditing,
    super.key,
  });
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimaryColor, width: 2.w)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isEditing
                ? Align(
                    alignment: Alignment.topLeft,
                    child:
                        Image.asset(AssetsData.editIcon, fit: BoxFit.contain))
                : const Text(' '),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'محمد مصيلحي ',
                  textDirection: TextDirection.rtl,
                  style: TextStyles.textstyle14
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '0502527234',
                  textDirection: TextDirection.rtl,
                  style: TextStyles.textstyle14
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    'جدة 23 شارع عبد القدوس الانصارى بجانب مستوصف سابا',
                    textDirection: TextDirection.rtl,
                    style: TextStyles.textstyle14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.hintColor),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
