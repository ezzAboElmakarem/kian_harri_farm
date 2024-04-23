import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/Product_details/model/product_details_model.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class ExtraServicesDropDown extends StatefulWidget {
  const ExtraServicesDropDown({super.key, this.productDetailsModel});

  final ProductDetailsModel? productDetailsModel;

  @override
  State<ExtraServicesDropDown> createState() => _ExtraServicesDropDownState();
}

class _ExtraServicesDropDownState extends State<ExtraServicesDropDown> {
  // final List<String> items = [
  //   'تجريد من العظم',
  //   '2تجريد من العظم',
  //   'تجريد من لعظم3',
  // ];

  String? selectedItem;

  // List<DropdownMenuItem<String>> buildDropdownItems() {
  //   List<DropdownMenuItem<String>>? dropdownItems = [];

  //   // Check if productDetailsModel is not null and contains additions
  //   if (widget.productDetailsModel?.addition != null) {
  //     // Map over the additions and create dropdown items
  //     dropdownItems = widget.productDetailsModel?.addition?.map((addition) {
  //       return DropdownMenuItem<String>(
  //         value: addition.id.toString(), // Assuming id is of type int
  //         child: Text(addition.name ?? ''), // Display the name of the addition
  //       );
  //     }).toList();
  //   }

  //   return dropdownItems;
  // }

  @override
  Widget build(BuildContext context) {
    var bloc = ProductDetailsBloc.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 24.h, right: 12.w, left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'خدمات أضافية ',
            //textdirection: TextDirection.rtl,
            style: TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Center(
            child: Container(
              width: 344.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: ColorStyles.greyColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                dropdownColor: ColorStyles.greyColor,
                iconEnabledColor: ColorStyles.greyColor,
                isExpanded: true,
                hint: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Container(
                    height: double.maxFinite,
                    alignment: Alignment.centerRight,
                    color: ColorStyles.greyColor,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100.w,
                        ),
                        Center(
                          child: Text(
                            'press_to_choose'.tr(),
                            style: TextStyles.textstyle14
                                .copyWith(fontSize: 10.sp),
                          ),
                        ),
                        // SizedBox(
                        //   width: 12.w,
                        // ),
                        // Text('(+5\$)',
                        //     style: TextStyles.textstyle12
                        //         .copyWith(color: kPrimaryColor)),
                        // SizedBox(
                        //   width: 160.w,
                        // ),
                        const Spacer(),
                        Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 18.sp,
                            )),
                      ],
                    ),
                  ),
                ),
                value: selectedItem,
                icon: null,
                underline: Container(),
                onChanged: (String? newValue) {
                  // Map<String,dynamic>? addtionalServiceId;
                  log(newValue ?? 'no data');
                  setState(() {
                    selectedItem = newValue;
                    bloc.addition = widget
                        .productDetailsModel?.data?.offer?.addition
                        ?.firstWhere((element) => element.name == newValue)
                        .id
                        .toString();
                    log('addtianal id${bloc.addition}');
                  });

                  //    widget.productDetailsModel?.addition?.forEach((choice) {
                  //   addtionalServiceId = choice.toString();
                  // });
                },
                items: widget.productDetailsModel?.data?.offer?.addition
                        ?.map((e) => DropdownMenuItem<String>(
                              value: e.name,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(e.name ?? ''),
                              ),
                            ))
                        .toList() ??
                    [],
              ),
              //   items: addtionalChoices.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       alignment: isArabic()
              //           ? Alignment.centerRight
              //           : Alignment.centerLeft,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text(
              //             value,
              //           ),
              //           SizedBox(
              //             width: 16.w,
              //           ),
              //           Text('(+5\$)',
              //               style: TextStyles.textstyle12
              //                   .copyWith(color: kPrimaryColor)),

              //           //textdirection: TextDirection.rtl),
              //         ],
              //       ),
              //     );
              //   }).toList(),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
