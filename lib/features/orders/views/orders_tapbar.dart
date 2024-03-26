import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'finished_orders_list.dart';
import 'on_going_orders_list.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class OrdersTabBar extends StatelessWidget {
  const OrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('my_orders'.tr(), style: TextStyles.textstyle16),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 24.sp,
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'finished'.tr(),
              ),
              Tab(text: 'current'.tr()),
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
