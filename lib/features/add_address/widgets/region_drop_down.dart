import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/add_address_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/views/model/cities_and_regions_model.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class RegionDropDown extends StatefulWidget {
  const RegionDropDown({super.key, required this.regionData});
  final CitiesAndRegionsModel regionData;
  @override
  State<RegionDropDown> createState() => _CitiesDropDownState();
}

class _CitiesDropDownState extends State<RegionDropDown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final bloc = AddAddressBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'region'.tr(),
          style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: kPrimaryColor,
              ),
            ),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              iconEnabledColor: ColorStyles.greyColor,
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  height: double.maxFinite,
                  alignment: Alignment.centerRight,
                  color: Colors.white,
                ),
              ),
              value: selectedItem,
              icon: null,
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                  log(newValue ?? 'no data');

                  // Find the selected region
                  final selectedRegion = widget.regionData.data?.firstWhere(
                    (region) => region.name == newValue,
                    orElse: () => CitiesAndRegionsData(
                        id: 0), // Provide a default value if not found
                  );

                  // If a selected region is found, set lastRegionId to its ID
                  if (selectedRegion != null) {
                    log(selectedRegion.id.toString());
                    bloc.countryId =
                        selectedRegion.id.toString(); // Convert int? to String
                  }
                });
              },
              items: widget.regionData.data
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
          ),
        ),
      ],
    );
  }
}
