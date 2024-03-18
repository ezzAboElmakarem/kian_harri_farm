import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/custom_radio_tile_item.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductTypeRadios extends StatefulWidget {
  const ProductTypeRadios({
    super.key,
  });

  @override
  State<ProductTypeRadios> createState() => _ProductTypeRadiosState();
}

class _ProductTypeRadiosState extends State<ProductTypeRadios> {
  String selectedOption = '';
  List<String> typeOptions = [
    'ذبيحه غير مطبوخه',
    'لا  شئ',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'نوع الطلب',
          style: TextStyles.textstyle16,
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 160.h,
          width: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomRadioTileItem(
              title: typeOptions[index],
              groupValue: selectedOption,
              value: typeOptions[index],
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              selected: selectedOption == typeOptions[index],
            ),
            itemCount: typeOptions.length,
          ),
        ),
      ],
    );
  }
}
