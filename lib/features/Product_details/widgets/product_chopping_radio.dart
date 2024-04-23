import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/Product_details/model/product_details_model.dart';
import '../../categories/widgets/custom_radio_tile_item.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class ProductchoppingRadios extends StatefulWidget {
  const ProductchoppingRadios({
    super.key,
    this.productDetailsModel,
  });
  final ProductDetailsModel? productDetailsModel;

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
    var bloc = ProductDetailsBloc.of(context);

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
                  title: widget.productDetailsModel?.data?.offer
                          ?.cutting?[index].name ??
                      choppingOptions[index],
                  groupValue: selectedOption,
                  value: widget.productDetailsModel?.data?.offer
                          ?.cutting?[index].name ??
                      choppingOptions[index],
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                      bloc.cuttingId = widget
                          .productDetailsModel?.data?.offer?.cutting
                          ?.firstWhere((element) => element.name == value)
                          .id
                          .toString();
                      log('cutting id ${bloc.addition}');
                    });
                  },
                  selected: selectedOption ==
                      widget.productDetailsModel?.data?.offer?.cutting?[index]
                          .name,
                  secondaryText: Text(
                    widget.productDetailsModel?.data?.offer?.cutting?[index]
                            .price ??
                        '(+\$ $addtionalMoney)',
                    style: TextStyles.textstyle12.copyWith(
                        color: ColorStyles.textGreyColor.withOpacity(0.6)),
                  ),
                );
              },
              itemCount:
                  widget.productDetailsModel?.data?.offer?.cutting?.length ??
                      choppingOptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
