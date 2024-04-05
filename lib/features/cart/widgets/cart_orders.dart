import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'orders_item.dart';
import '../../offers/views/all_offers_view.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class CartOrders extends StatelessWidget {
  const CartOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '3 منتجات',
              //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
              style:
                  TextStyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                navigateTo(context: context, widget: OffersView());
              },
              child: Text(
                'حذف السلة',
                style: TextStyles.textstyle14.copyWith(color: kPrimaryColor),
              ),
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
