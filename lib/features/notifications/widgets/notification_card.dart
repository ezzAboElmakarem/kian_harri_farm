import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/assets.dart';
import '../../../helper/text_styles.dart';

class NotificationCard extends StatelessWidget {
  final String title;

  final String dateTime;
  const NotificationCard({
    super.key,
    required this.title,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetsData.bellIcon,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(
            width: 14.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyles.textstyle14,
                //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                dateTime,
                //textdirection:isArabic() ? TextDirection.rtl : TextDirection.ltr,
                style: TextStyles.textstyle14
                    .copyWith(color: Colors.black.withOpacity(0.3)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
