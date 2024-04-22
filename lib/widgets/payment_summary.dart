import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/model/cart_model.dart';
import '../helper/color_styles.dart';
import '../helper/text_styles.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
    required this.cartDataModel,
  });
  final CartModel cartDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('payment_summary'.tr(), style: TextStyles.textstyle16),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Divider(
            height: 1.5,
            thickness: 1.5,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Text('sub_total'.tr(), style: TextStyles.textstyle14),
            const Spacer(),
            Text(cartDataModel.data?.totalPriceBefore ?? '450.00   LE',
                style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('discount'.tr(),
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor)),
            const Spacer(),
            Text(cartDataModel.data?.discount ?? '50.00   LE',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor)),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text("service fee".tr(), style: TextStyles.textstyle14),
            const Spacer(),
            Text(cartDataModel.data?.service ?? '40.00   LE',
                style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('shipping_fees'.tr(), style: TextStyles.textstyle14),
            const Spacer(),
            Text(cartDataModel.data?.tax ?? '40.00   LE',
                style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('added_tax_value'.tr(), style: TextStyles.textstyle14),
            const Spacer(),
            Text(cartDataModel.data?.taxVal ?? '10.00   LE',
                style: TextStyles.textstyle14),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: Text(
              '.................................................................................................',
              style: TextStyles.textstyle12
                  .copyWith(color: ColorStyles.hintColor)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('total_summation'.tr(), style: TextStyles.textstyle14),
            const Spacer(),
            Text(cartDataModel.data?.finalPrice ?? '450.00   LE',
                style: TextStyles.textstyle14),
          ],
        ),
      ],
    );
  }
}
