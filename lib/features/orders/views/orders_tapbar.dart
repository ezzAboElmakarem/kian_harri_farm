import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/orders/views/finished_orders_view.dart';
import 'package:kian_sheeps_projects/features/orders/views/on_going_orders.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class OrdersTabBar extends StatelessWidget {
  const OrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('طلباتى', style: TextStyles.textstyle16),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 24.sp,
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'المنتهية',
              ),
              Tab(text: 'الحالية'),
            ],
            indicatorColor: kPrimaryColor,
          ),
        ),
        body: const TabBarView(
          children: [
            FinishedOrdersList(),
            OnGoingOrdersList(),
          ],
        ),
      ),
    );
  }
}
