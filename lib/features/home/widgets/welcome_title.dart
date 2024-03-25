import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class HomeWelocmeTitle extends StatelessWidget {
  const HomeWelocmeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/welcome_hand.png'),
          SizedBox(
            width: 16.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).welcome_text,
                style: TextStyles.textstyle20
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                S.of(context).welcome_body_text,
                style: TextStyles.textstyle14
                    .copyWith(color: ColorStyles.textGreyColor),
              ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
