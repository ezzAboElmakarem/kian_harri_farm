import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/order_details/model/order_details_model.dart';
import '../../../widgets/payment_summary.dart';
import '../../../widgets/delivery_summary.dart';
import '../../order_success/views/order_success_view.dart';
import '../widgets/selcect_payment_way.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_button.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.orderDetails});
  final MyOrderDetailsModel orderDetails;

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
                DeliverySummary(isEditing: false, orderDetails: orderDetails),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'قم باختيار طريقة الدفع',
                      //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                      style: TextStyles.textstyle14,
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    const SelectPaymentWay(),
                    SizedBox(
                      height: 14.h,
                    ),
                    const PaymentSummary(),
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
