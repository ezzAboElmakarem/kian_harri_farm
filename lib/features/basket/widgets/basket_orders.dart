import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/basket/widgets/orders_item.dart';
import 'package:kian_sheeps_projects/features/offers/views/offers_view.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class BasketOrders extends StatelessWidget {
  const BasketOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                navigateTo(context: context, widget: OffersView());
              },
              child: Text(
                'حذف السلة',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
              ),
            ),
            const Spacer(),
            Text(
              '3 منتجات',
              textDirection: TextDirection.rtl,
              style:
                  TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 23.h,
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const OrderItem(),
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: 4),
        ),
      ],
    );
  }
}
