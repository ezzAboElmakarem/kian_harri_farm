import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/widgets/cart_buttons.dart';
import 'package:kian_sheeps_projects/features/cart/widgets/cart_orders.dart';
import 'package:kian_sheeps_projects/features/cart/widgets/coubon_field.dart';
import 'package:kian_sheeps_projects/widgets/payment_summary.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'السلة',
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
