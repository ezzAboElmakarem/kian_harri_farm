import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomTextFormField(
        ispassword: false,
        hint: 'ابحث عن منتج',
        suffixIcon: Icon(
          Icons.search_outlined,
          color: ColorStyles.textGreyColor.withOpacity(0.4),
        ),
      ),
    );
  }
}
