import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class CoubonField extends StatelessWidget {
  const CoubonField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      ispassword: false,
      isEnabled: true,
      hint: 'اضف كوبون خصم',
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: GestureDetector(
          onTap: () {},
          child: Text(
            textAlign: TextAlign.center,
            'تفعيل',
            style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
          ),
        ),
      ),
      suffixIcon: Image.asset(AssetsData.coubonIcon),
    );
    /*   Container(
      width: 344.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: ColorStyles.greyColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
              onTap: () {},
              child: Text(
                'تفعيل',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
              )),
          const Spacer(),
          Text(
            'اضف كوبون خصم',
            style: TextStyles.textstyle14
                .copyWith(color: Colors.black.withOpacity(0.5)),
          ),
          SizedBox(
            width: 8.w,
          ),
          Image.asset(AssetsData.coubonIcon),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );*/
  }
}
