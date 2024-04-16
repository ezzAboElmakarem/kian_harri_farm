import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/text_styles.dart';

class DrawerSectionItem extends StatelessWidget {
  const DrawerSectionItem({
    super.key,
    required this.sectionTitle,
    required this.sectionIcon,
    required this.onTap,
    required this.navigationButton,
  });
  final String sectionTitle;
  final String sectionIcon;
  final bool navigationButton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Image.asset(
              sectionIcon,
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              sectionTitle,
              style: TextStyles.textstyle14,
            ),
            const Spacer(),
            navigationButton
                ? Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.sp,
                  )
                : const Text(' '),
          ],
        ),
      ),
    );
  }
}
