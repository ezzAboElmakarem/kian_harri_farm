import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              const Icon(Icons.close_rounded),
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
