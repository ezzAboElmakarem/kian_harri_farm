import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomRadioTileItem extends StatelessWidget {
  final String title;
  final String groupValue;
  final String value;
  final Function(String?)? onChanged;
  final bool selected;

  const CustomRadioTileItem({
    super.key,
    required this.title,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyles.textstyle14
            .copyWith(color: selected ? kPrimaryColor : Colors.black),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
