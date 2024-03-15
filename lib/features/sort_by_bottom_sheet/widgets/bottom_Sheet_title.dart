import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.circleXmark,
                  size: 22.sp, color: ColorStyles.textGreyColor),
              SizedBox(
                width: 100.w,
              ),
              Text('ترتيب بواسطة',
                  style: TextStyles.textstyle16
                      .copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 31.h,
        ),
      ],
    );
  }
}
