import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/shipping_address/views/customer_address_view.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

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
            buttonText: 'اتمام الطلب',
            textColor: Colors.white,
            onTap: () {
              navigateTo(context: context, widget: const CustomerAddressView());
            },
            width: 160.w),
        SizedBox(
          width: 20.w,
        ),
        CustomButton(
            buttonText: 'الرجوع للتسوق',
            onTap: () {},
            width: 160.w,
            buttonColor: ColorStyles.textFormFieldfillColor,
            textColor: Colors.black),
      ],
    );
  }
}
