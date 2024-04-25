import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/add_address_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/views/model/cities_and_regions_model.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class CitiesDropDown extends StatefulWidget {
  const CitiesDropDown({super.key, required this.citiesData});
  final CitiesAndRegionsModel citiesData;
  @override
  State<CitiesDropDown> createState() => _CitiesDropDownState();
}

class _CitiesDropDownState extends State<CitiesDropDown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    final bloc = AddAddressBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'city'.tr(),
          style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: Container(
            width: double.infinity,
            // height: 65.h,
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
              items: widget.citiesData.data
                      ?.map((e) => DropdownMenuItem<String>(
                            value: e.id.toString(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(e.name ?? ''),
                            ),
                          ))
                      .toList() ??
                  [],
              onChanged: (String? newValue) {
                // String? lastCityId; // Variable to store the last city ID

                setState(() {
                  selectedItem = newValue;
                  log(newValue ?? 'no data');

                  // Pass the list of IDs to the bloc
                  CitiesAndRegionsBloc.of(context).add(Read(
                    arguments:
                        widget.citiesData.data!.map((e) => e.id).toList(),
                  ));

                  // Find the last city ID and store it
                  // widget.citiesData.data!.forEach((city) {
                  //   lastCityId = city.id.toString();
                  // });
                  bloc.cityId = selectedItem ?? "0";
                });
                // Log the last city ID if it's not null
                // if (lastCityId != null) {
                //   log(lastCityId!);
                // }
                // Assign the last city ID to bloc.cityId
              },
            ),
          ),
        ),
      ],
    );
  }
}
