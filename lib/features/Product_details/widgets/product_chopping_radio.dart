import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../categories/widgets/custom_radio_tile_item.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'chopping_type'.tr(),
            style: TextStyles.textstyle16,
            //textdirection: TextDirection.rtl,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}
