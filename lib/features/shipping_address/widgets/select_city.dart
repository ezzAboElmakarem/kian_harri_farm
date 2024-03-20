import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

// ignore: must_be_immutable
class CountryDropDown extends StatelessWidget {
  CountryDropDown({
    super.key,
  });

  List<String> list = [
    'المحلة',
    'المنصورة',
    'القاهرة ',
    'الجيزة',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'المدينة',
          style: TextStyles.textstyle16,
        ),
        SizedBox(
          height: 10.h,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: CustomDropdown<String>(
            //hintText: 'اختار المدينة',
            items: list,
            decoration: CustomDropdownDecoration(
                closedFillColor: ColorStyles.textFormFieldfillColor),
            initialItem: list[0],
            onChanged: (value) {
              log('changing value to: $value');
            },
          ),
        ),
      ],
    );
  }
}
