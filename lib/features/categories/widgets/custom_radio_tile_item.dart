import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class CustomRadioTileItem extends StatelessWidget {
  final String title;
  String? groupValue;
  String value;
  final Function(String?)? onChanged;
  final bool selected;
  final Widget? secondaryText;
  //final bool isSelected;
  CustomRadioTileItem({
    super.key,
    required this.title,
    this.groupValue,
    required this.value,
    this.onChanged,
    required this.selected,
    this.secondaryText,
    // required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
      title: Text(
        title,
        // textAlign: TextAlign.right,
        style: TextStyles.textstyle14
            .copyWith(color: selected ? kPrimaryColor : Colors.black),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      secondary: secondaryText,
    );
  }
}
