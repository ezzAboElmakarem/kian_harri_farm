import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/sort_by_bottom_sheet/widgets/custom_radio_tile_item.dart';

class BottomSheetRadios extends StatefulWidget {
  const BottomSheetRadios({super.key});

  @override
  State<BottomSheetRadios> createState() => _BottomSheetRadiosState();
}

class _BottomSheetRadiosState extends State<BottomSheetRadios> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            const CustomRadioTileItem(sortType: 'أعلي سعر', value: '1'),
        separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
        itemCount: 5);
    // Column(
    //   children: [
    //     RadioListTile(
    //       controlAffinity: ListTileControlAffinity.trailing,
    //       activeColor: kPrimaryColor,
    //       contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
    //       title: Text(
    //         'الاكثر مبيعا',
    //         textAlign: TextAlign.right,
    //         style: TextStyles.textstyle14.copyWith(
    //             color: selectedOption == '1' ? kPrimaryColor : Colors.black),
    //       ),
    //       value: '1',
    //       groupValue: selectedOption,
    //       onChanged: (value) {
    //         setState(() {
    //           selectedOption = value.toString();
    //         });
    //       },
    //     ),
    //     SizedBox(
    //       height: 12.h,
    //     ),
    //     RadioListTile(
    //       controlAffinity: ListTileControlAffinity.trailing,
    //       activeColor: kPrimaryColor,
    //       contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
    //       title: Text(
    //         'الاعلى تقيما',
    //         textAlign: TextAlign.right,
    //         style: TextStyles.textstyle14.copyWith(
    //             color: selectedOption == '2' ? kPrimaryColor : Colors.black),
    //       ),
    //       value: '2',
    //       groupValue: selectedOption,
    //       onChanged: (value) {
    //         setState(() {
    //           selectedOption = value.toString();
    //         });
    //       },
    //     ),
    //     SizedBox(
    //       height: 12.h,
    //     ),
    //     RadioListTile(
    //       activeColor: kPrimaryColor,
    //       controlAffinity: ListTileControlAffinity.trailing,
    //       contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
    //       title: Text(
    //         ' من السعر الاعلي الي الاقل',
    //         textAlign: TextAlign.right,
    //         style: TextStyles.textstyle14.copyWith(
    //             color: selectedOption == '3' ? kPrimaryColor : Colors.black),
    //       ),
    //       value: '3',
    //       groupValue: selectedOption,
    //       onChanged: (value) {
    //         setState(() {
    //           selectedOption = value.toString();
    //         });
    //       },
    //     ),
    //     SizedBox(
    //       height: 12.h,
    //     ),
    //     RadioListTile(
    //       activeColor: kPrimaryColor,
    //       controlAffinity: ListTileControlAffinity.trailing,
    //       contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
    //       title: Text(
    //         ' من السعر الاقل الي الاعلى',
    //         textAlign: TextAlign.right,
    //         style: TextStyles.textstyle14.copyWith(
    //             color: selectedOption == '4' ? kPrimaryColor : Colors.black),
    //       ),
    //       value: '4',
    //       groupValue: selectedOption,
    //       onChanged: (value) {
    //         setState(() {
    //           selectedOption = value.toString();
    //         });
    //       },
    //     ),
    //     SizedBox(
    //       height: 12.h,
    //     ),
    //   ],
    // );
  }
}
