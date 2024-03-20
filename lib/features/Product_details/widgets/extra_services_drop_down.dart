import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ExtraServicesDropDown extends StatefulWidget {
  const ExtraServicesDropDown({super.key});

  @override
  State<ExtraServicesDropDown> createState() => _ExtraServicesDropDownState();
}

class _ExtraServicesDropDownState extends State<ExtraServicesDropDown> {
  final List<String> items = [
    'تجريد من العظم',
    '2تجريد من العظم',
    'تجريد من العظم3',
  ];

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h, right: 16.w, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'خدمات أضافية ',
            textDirection: TextDirection.rtl,
            style: TextStyles.textstyle14.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8.h,
          ),
          Center(
            child: Container(
              width: 344.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: ColorStyles.greyColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                dropdownColor: ColorStyles.greyColor,
                iconEnabledColor: ColorStyles.greyColor,
                isExpanded: true,
                hint: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Container(
                    height: double.maxFinite,
                    alignment: Alignment.centerRight,
                    color: ColorStyles.greyColor,
                    child: Row(
                      children: [
                        Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 18.sp,
                            )),
                        SizedBox(
                          width: 144.w,
                        ),
                        Text('(+5\$)',
                            style: TextStyles.textstyle12
                                .copyWith(color: kPrimaryColor)),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          'تجريد من العظم',
                          style: TextStyles.textstyle14,
                        ),
                      ],
                    ),
                  ),
                ),
                value: selectedItem,
                icon: null,
                underline: Container(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('(+5\$)',
                            style: TextStyles.textstyle12
                                .copyWith(color: kPrimaryColor)),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(value, textDirection: TextDirection.rtl),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
