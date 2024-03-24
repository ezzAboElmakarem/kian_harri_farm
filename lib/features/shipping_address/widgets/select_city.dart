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
    required this.fieldTitle,
    required this.dataList,
  });
  final String fieldTitle;
  final List<String> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          fieldTitle,
          style: TextStyles.textstyle16,
        ),
        SizedBox(
          height: 10.h,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: CustomDropdown<String>(
            //hintText: 'اختار المدينة',
            items: dataList,
            decoration: CustomDropdownDecoration(
                closedFillColor: ColorStyles.textFormFieldfillColor),
            initialItem: dataList[0],
            onChanged: (value) {
              log('changing value to: $value');
            },
          ),
        ),
      ],
    );
  }
}
