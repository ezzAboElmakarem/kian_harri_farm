import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';
import '../../categories/widgets/custom_radio_tile_item.dart';
import '../../../helper/text_styles.dart';

class ProductpackagingRadios extends StatefulWidget {
  const ProductpackagingRadios({
    super.key,
    this.productDetailsModel,
  });
  final ProductModel? productDetailsModel;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'encapsulation'.tr(),
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
                title: widget.productDetailsModel?.wrapping?[index].name ??
                    packagingOptions[index],
                groupValue: selectedOption,
                value: widget.productDetailsModel?.wrapping?[index].name ??
                    packagingOptions[index],
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
                selected: selectedOption ==
                    widget.productDetailsModel?.wrapping?[index].name,
              ),
              itemCount: widget.productDetailsModel?.wrapping?.length ??
                  packagingOptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
