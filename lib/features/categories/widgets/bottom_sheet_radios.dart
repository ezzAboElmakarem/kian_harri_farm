import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/custom_radio_tile_item.dart';

class BottomSheetRadiosList extends StatefulWidget {
  const BottomSheetRadiosList({super.key});

  @override
  State<BottomSheetRadiosList> createState() => _BottomSheetRadiosListState();
}

class _BottomSheetRadiosListState extends State<BottomSheetRadiosList> {
  String selectedOption = '';
  List<String> options = [
    'الأكثر مبيعا',
    'الأعلي تقيما',
    ' من السعر الاعلي الي الاقل',
    ' من السعر الاقل الي الاعلى',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000.h,
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomRadioTileItem(
            title: options[index],
            groupValue: selectedOption,
            value: options[index],
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
            selected: selectedOption == options[index],
          );
        },
      ),
    );
  }
}
