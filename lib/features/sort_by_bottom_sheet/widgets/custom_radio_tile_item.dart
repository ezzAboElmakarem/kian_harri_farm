import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CustomRadioTileItem extends StatefulWidget {
  const CustomRadioTileItem(
      {super.key, required this.sortType, required this.value});
  final String sortType;
  final String value;
  @override
  State<CustomRadioTileItem> createState() => _CustomRadioTileItemState();
}

class _CustomRadioTileItemState extends State<CustomRadioTileItem> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
      title: Text(
        widget.sortType,
        textAlign: TextAlign.right,
        style: TextStyles.textstyle14.copyWith(
            color:
                selectedOption == widget.value ? kPrimaryColor : Colors.black),
      ),
      value: widget.value,
      groupValue: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value.toString();
        });
      },
    );
  }
}
