import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/bottom_Sheet_title.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class SortBySheet extends StatefulWidget {
  const SortBySheet({super.key});

  @override
  State<SortBySheet> createState() => _SortBySheetState();
}

class _SortBySheetState extends State<SortBySheet> {
  String selectedOption = '';
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const BottomSheetTitle(),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
              value: '1',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
              title: Text(
                'الاكثر مبيعا',
                textAlign: TextAlign.right,
                style: TextStyles.textstyle14.copyWith(
                    color:
                        selectedOption == '1' ? kPrimaryColor : Colors.black),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
              title: Text(
                'الاعلى تقيما',
                textAlign: TextAlign.right,
                style: TextStyles.textstyle14.copyWith(
                    color:
                        selectedOption == '2' ? kPrimaryColor : Colors.black),
              ),
              value: '2',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
              title: Text(
                ' من السعر الاعلي الي الاقل',
                textAlign: TextAlign.right,
                style: TextStyles.textstyle14.copyWith(
                    color:
                        selectedOption == '3' ? kPrimaryColor : Colors.black),
              ),
              value: '3',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
              title: Text(
                ' من السعر الاقل الي الاعلى',
                textAlign: TextAlign.right,
                style: TextStyles.textstyle14.copyWith(
                    color:
                        selectedOption == '4' ? kPrimaryColor : Colors.black),
              ),
              value: '4',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
