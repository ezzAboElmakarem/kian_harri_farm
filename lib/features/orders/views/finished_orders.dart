import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/order_item.dart';

class FinishedOrders extends StatelessWidget {
  const FinishedOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 4.w,
        ),
        itemBuilder: (context, index) => const OrderItem(
              orderID: 6556589,
              orderStatus: 'طلب مرفوض',
            ),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 9);
  }
}
