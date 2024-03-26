import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../categories/widgets/custom_radio_tile_item.dart';
import '../../../helper/text_styles.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'order_type'.tr(),
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
      ),
    );
  }
}
