import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/widgets/payment_summary.dart';
import 'package:kian_sheeps_projects/features/order_details/widgets/products_details_list.dart';
import 'package:kian_sheeps_projects/features/order_details/widgets/refused_reason.dart';
import 'package:kian_sheeps_projects/widgets/delivery_summary.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView(
      {super.key, required this.orderStatus, required this.orderID});
  final String orderStatus;
  final int orderID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'تفاصيل الطلب'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset(AssetsData.box)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text('المجموع الكلي', style: TextStyles.textstyle14),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text('300 .00 SR', style: TextStyles.textstyle14),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                    orderStatus.contains('مرفوض') ? 'مرفوض' : orderStatus,
                    style: TextStyles.textstyle14.copyWith(
                        color: orderStatus.contains('مرفوض')
                            ? ColorStyles.redColor
                            : kPrimaryColor)),
              ),
              ProductsDetailsList(orderID: orderID),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('بيانات التوصيل', style: TextStyles.textstyle14),
                  SizedBox(
                    height: 16.h,
                  ),
                  const DeliverySummary(),
                  SizedBox(
                    height: 20.h,
                  ),
                  orderStatus.contains('مرفوض')
                      ? const RefusedReason()
                      : const PaymentSummary(),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Center(
                  child: CustomButton(
                      buttonText: 'اعادة الطلب مرة اخري', onTap: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
