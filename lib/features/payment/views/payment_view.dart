import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/widgets/payment_pref.dart';
import 'package:kian_sheeps_projects/features/payment/widgets/delivery_summary.dart';
import 'package:kian_sheeps_projects/features/order_success/views/order_success_view.dart';
import 'package:kian_sheeps_projects/features/payment/widgets/selcect_payment_way.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'الدفع'),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CustomTextButton(
                      text: 'اضافة عنوان',
                      onTap: () {},
                      textColor: kPrimaryColor,
                    ),
                    const Spacer(),
                    Text('بيانات التوصيل', style: TextStyles.textstyle16),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const DeliverySummary(),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'قم باختيار طريقة الدفع',
                      textDirection: TextDirection.rtl,
                      style: TextStyles.textstyle14,
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    const SelectPaymentWay(),
                    SizedBox(
                      height: 14.h,
                    ),
                    const PaymentPref(),
                    SizedBox(
                      height: 60.h,
                    ),
                    Center(
                      child: CustomButton(
                          buttonText: 'اتمام الطلب',
                          textColor: Colors.white,
                          onTap: () {
                            navigateTo(
                                context: context, widget: const OrderSuccess());
                          },
                          width: 328.w),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
