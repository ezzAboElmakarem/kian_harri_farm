import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/basket/widgets/basket_buttons.dart';
import 'package:kian_sheeps_projects/features/basket/widgets/basket_orders.dart';
import 'package:kian_sheeps_projects/features/basket/widgets/coubon_field.dart';
import 'package:kian_sheeps_projects/features/basket/widgets/order_pref.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'السلة',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const BasketOrders(),
              const CoubonField(),
              SizedBox(
                height: 24.h,
              ),
              const OrderPref(),
              SizedBox(
                height: 60.h,
              ),
              const BasketButtons(),
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
