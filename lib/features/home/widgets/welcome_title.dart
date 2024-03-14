import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class HomeWelocmeTitle extends StatelessWidget {
  const HomeWelocmeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ', مرحبا بك من جديد',
                style: TextStyles.textstyle20
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                'جميع منتجاتك متوفرة بأفضل الأسعار',
                style: TextStyles.textstyle14
                    .copyWith(color: ColorStyles.textGreyColor),
              ),
            ],
          ),
          SizedBox(
            width: 16.w,
          ),
          Image.asset('assets/images/welcome_hand.png'),
        ],
      ),
    );
  }
}
