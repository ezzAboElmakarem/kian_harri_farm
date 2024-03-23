import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/orders/widgets/order_card.dart';
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

class FinishedOrdersList extends StatelessWidget {
  const FinishedOrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) => const Orderstatus(
              orderID: 123500,
              orderStatus: 'قيد التوصيل',
            ),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 9);
  }
}

class OnGoingOrdersList extends StatelessWidget {
  const OnGoingOrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) => const Orderstatus(
              orderID: 6556589,
              orderStatus: 'طلب مرفوض',
            ),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 9);
  }
}
