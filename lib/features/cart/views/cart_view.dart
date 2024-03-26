import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/cart_buttons.dart';
import '../widgets/cart_orders.dart';
import '../widgets/coubon_field.dart';
import '../../../widgets/payment_summary.dart';
import '../../../helper/app_bar_method.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'cart'.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              const CartOrders(),
              SizedBox(
                height: 16.h,
              ),
              const CoubonField(),
              SizedBox(
                height: 24.h,
              ),
              const PaymentSummary(),
              SizedBox(
                height: 60.h,
              ),
              const CartButtons(),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
