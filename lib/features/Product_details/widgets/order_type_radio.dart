import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
import '../../categories/widgets/custom_radio_tile_item.dart';
import '../../../helper/text_styles.dart';

class OrderTypeRadios extends StatefulWidget {
  const OrderTypeRadios({
    super.key,
    required this.productDetailsModel,
  });
  final ProductModel? productDetailsModel;
  @override
  State<OrderTypeRadios> createState() => _OrderTypeRadiosState();
}

class _OrderTypeRadiosState extends State<OrderTypeRadios> {
  String selectedOption = '';
  List<String> typeOptions = [
    'ذبيحه غير مطبوخه',
    'لا  شئ',
  ];

  // List<Map<String, dynamic>> filters = [
  //   {
  //     "id": 0,
  //     "title": "الكل",
  //   },
  // ];
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
