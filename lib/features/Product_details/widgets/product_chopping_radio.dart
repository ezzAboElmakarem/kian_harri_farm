import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/custom_radio_tile_item.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductchoppingRadios extends StatefulWidget {
  const ProductchoppingRadios({
    super.key,
  });

  @override
  State<ProductchoppingRadios> createState() => _ProductchoppingRadiosState();
}

class _ProductchoppingRadiosState extends State<ProductchoppingRadios> {
  String selectedOption = '';
  List<String> choppingOptions = [
    '1 طريقة تقطيع ',
    '2 طريقة تقطيع ',
    '3 طريقة تقطيع ',
  ];
  int addtionalMoney = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'نوع التقطيع',
          style: TextStyles.textstyle16,
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomRadioTileItem(
                title: choppingOptions[index],
                groupValue: selectedOption,
                value: choppingOptions[index],
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
                selected: selectedOption == choppingOptions[index],
                secondaryText: Text(
                  '(+\$ $addtionalMoney)',
                  style: TextStyles.textstyle12.copyWith(
                      color: ColorStyles.textGreyColor.withOpacity(0.6)),
                ),
              );
            },
            itemCount: choppingOptions.length,
          ),
        ),
      ],
    );
  }
}
