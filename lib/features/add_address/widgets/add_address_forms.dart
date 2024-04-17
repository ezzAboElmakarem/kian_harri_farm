import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/add_address_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/views/model/cities_and_regions_model.dart';
import 'package:kian_sheeps_projects/features/add_address/widgets/cities_drop_down.dart';
import 'package:kian_sheeps_projects/features/add_address/widgets/region_drop_down.dart';
import '../../shipping_address/widgets/shipping_address.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';
import '../../../widgets/custom_tex_form_field.dart';

class AddAddressForms extends StatelessWidget {
  const AddAddressForms({
    super.key,
    required this.citiesData,
    required this.regionData,
  });
  final CitiesAndRegionsModel citiesData, regionData;
  // final RegionsModel regionData;
  @override
  Widget build(BuildContext context) {
    final bloc = AddAddressBloc.of(context);

    return Column(
      children: [
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'name'.tr(),
          controller: bloc.nameController,
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'phone'.tr(),
          type: TextInputType.phone,
          controller: bloc.phoneController,
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'address_details'.tr(),
          type: TextInputType.phone,
          controller: bloc.addressDetailsController,
        ),

        SizedBox(height: 10.h),
        CitiesDropDown(citiesData: citiesData),
        SizedBox(height: 10.h),
        regionData.data == null
            ? const SizedBox()
            : Column(
                children: [
                  RegionDropDown(regionData: regionData),
                  SizedBox(height: 10.h),
                ],
              ),
        // CountryDropDown(
        //   fieldTitle: 'المدينة',
        //   // dataList: citiesData.data!.map((e) => e.id.toString()).toList(),
        //   dataList: citiesData.data!.map((e) => e).toList(),
        //   onChange: (value) {
        //     log('changing value to: $value');
        //     CitiesAndRegionsBloc.of(context).add(Read(arguments: value.id));
        //   },
        // ),

        // SizedBox(height: 10.h),
        // SizedBox(height: 10.h),
        // CountryDropDown(
        //   fieldTitle: 'المنطقة',
        //   onChange: (value) {
        //     log('changing value to: $value');
        //     //  CitiesAndRegionsBloc.of(context).add(Read(
        //     //             arguments:
        //     //            ));
        //   },
        //   dataList: regionData.data?.map((e) => e).toList(),
        // ),

        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "neighborhood".tr(),
          controller: bloc.neighborhoodController,
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "street_name".tr(),
          controller: bloc.streetNameController,
        ),

        SizedBox(height: 10.h),

        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "residential_number".tr(),
          controller: bloc.buildingNumberController,
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "notes".tr(),
          controller: bloc.notesController,
        ),
        SizedBox(height: 10.h),

        GestureDetector(
          onTap: () {
            navigateTo(context: context, widget: const ShippingAddress());
          },
          child: CustomTextFormField(
            ispassword: false,
            isEnabled: false,
            title: 'تحديد موقع الاستلام على الخريطة',
            prefixIcon: Image.asset(AssetsData.arrowPointer),
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
