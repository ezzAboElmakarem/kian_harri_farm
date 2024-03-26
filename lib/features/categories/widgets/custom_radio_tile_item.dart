import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class CustomRadioTileItem extends StatelessWidget {
  final String title;
  final String groupValue;
  final String value;
  final Function(String?)? onChanged;
  final bool selected;
  final Widget? secondaryText;
  final Function()? onTap;
  //final bool isSelected;
  const CustomRadioTileItem({
    super.key,
    required this.title,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.selected,
    this.secondaryText,
    this.onTap,
    // required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RadioListTile(
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
      ),
    );
  }
}
