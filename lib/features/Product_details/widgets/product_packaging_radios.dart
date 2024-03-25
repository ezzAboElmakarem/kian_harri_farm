import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/custom_radio_tile_item.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class ProductpackagingRadios extends StatefulWidget {
  const ProductpackagingRadios({
    super.key,
  });

  @override
  State<ProductpackagingRadios> createState() => _ProductpackagingRadiosState();
}

class _ProductpackagingRadiosState extends State<ProductpackagingRadios> {
  String selectedOption = '';
  List<String> packagingOptions = [
    'اكياس',
    'كيس واحد',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'التغليف',
            style: TextStyles.textstyle16,
            //textdirection: TextDirection.rtl,
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
                title: packagingOptions[index],
                groupValue: selectedOption,
                value: packagingOptions[index],
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
                selected: selectedOption == packagingOptions[index],
              ),
              itemCount: packagingOptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
