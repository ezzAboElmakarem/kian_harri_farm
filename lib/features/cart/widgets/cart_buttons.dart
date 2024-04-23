import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/shipping_address/bloc/customer_address_bloc.dart';
import 'package:kian_sheeps_projects/features/shipping_address/views/customer_address_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../../helper/color_styles.dart';
import '../../../widgets/custom_button.dart';

class CartButtons extends StatelessWidget {
  const CartButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            buttonText: 'confirm_order'.tr(),
            textColor: Colors.white,
            onTap: () {
              // navigateTo(context: context, widget: const CustomerAddressView());
              CustomerAddressBloc.of(context).add(Get());

              RouteUtils.navigateTo(const CustomerAddressView());
            },
            width: 160.w),
        SizedBox(
          width: 20.w,
        ),
        CustomButton(
            buttonText: 'back_to_shopping'.tr(),
            onTap: () {},
            width: 160.w,
            buttonColor: ColorStyles.textFormFieldfillColor,
            textColor: Colors.black),
      ],
    );
  }
}
