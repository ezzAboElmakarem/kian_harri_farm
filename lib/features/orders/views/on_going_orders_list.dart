import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/order_item.dart';

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
        itemBuilder: (context, index) => const OrderItem(
              orderID: 6556589,
              orderStatus: 'طلب مرفوض',
            ),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 9);
  }
}
