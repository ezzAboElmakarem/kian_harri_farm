import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class RefusedReason extends StatelessWidget {
  const RefusedReason({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(' سبب الرفض', style: TextStyles.textstyle14),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              height: 1.5,
              thickness: 1.5,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Text(
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى اضافة الى زيادة عدد الحروف التى يولدها التطبيق.",
              //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
              style: TextStyles.textstyle14
                  .copyWith(color: ColorStyles.hintColor, fontSize: 13.sp)),
        ],
      ),
    );
  }
}
