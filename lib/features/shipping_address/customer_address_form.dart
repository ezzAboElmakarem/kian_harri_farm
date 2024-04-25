import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/addresses/model/address_model.dart';
import 'package:kian_sheeps_projects/features/payment/bloc/payment_bloc.dart';
import 'package:kian_sheeps_projects/features/shipping_address/bloc/customer_address_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/helper/validations.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class CustomerAddressForms extends StatelessWidget {
  const CustomerAddressForms({
    super.key,
    required this.addressData,
  });
  final AddressesModel addressData;
  // final RegionsModel regionData;
  @override
  Widget build(BuildContext context) {
    final bloc = PaymentBloc.of(context);

    return Form(
      key: bloc.formkey,
      child: Column(
        children: [
          CustomTextFormField(
            ispassword: false,
            isEnabled: true,
            title: 'name'.tr(),
            controller: bloc.nameController,
            validation: Validator.name,
            type: TextInputType.name,
          ),
          CustomTextFormField(
            ispassword: false,
            isEnabled: true,
            title: 'email'.tr(),
            controller: bloc.emailController,
            validation: Validator.email,
            type: TextInputType.name,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            ispassword: false,
            isEnabled: true,
            title: 'phone'.tr(),
            type: TextInputType.phone,
            controller: bloc.phoneController,
            validation: Validator.phone,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            ispassword: false,
            isEnabled: true,
            title: 'extra_phone'.tr(),
            type: TextInputType.phone,
            controller: bloc.extraPhoneController,
            validation: Validator.phone,
          ),
          SizedBox(height: 10.h),
          AddressDropDown(
            addressData: addressData,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            ispassword: false,
            isEnabled: true,
            title: "notes".tr(),
            controller: bloc.notesController,
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

class AddressDropDown extends StatefulWidget {
  const AddressDropDown({super.key, required this.addressData});
  final AddressesModel addressData;
  @override
  State<AddressDropDown> createState() => _CitiesDropDownState();
}

class _CitiesDropDownState extends State<AddressDropDown> {
  String? selectedAddressId;

  @override
  Widget build(BuildContext context) {
    final bloc = CustomerAddressBloc.of(context);
    final paymentBloc = PaymentBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'address'.tr(),
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
              value: selectedAddressId,
              icon: null,
              underline: Container(),
              items: bloc.addressesData.addresses
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
                setState(() {
                  selectedAddressId = newValue;

                  // final selectedAddress =
                  //     bloc.addressesData.addresses?.firstWhere(
                  //   (address) => address.id.toString() == newValue,
                  //   orElse: () => Address(),
                  // );

                  // final lastAddressId = newValue;
                  // log(lastAddressId ?? 'null..');

                  // Assign the last address ID to bloc.cityId
                  log(selectedAddressId ?? 'null..');
                  paymentBloc.addressId = selectedAddressId ?? "0";
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
