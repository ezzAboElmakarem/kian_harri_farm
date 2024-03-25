import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/order_details/views/order_details_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key, required this.orderStatus, required this.orderID});
  final String orderStatus;
  final int orderID;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context: context,
            widget: OrderDetailsView(
              orderStatus: orderStatus,
              orderID: orderID,
            ));
        log('message');
      },
      child: Container(
        color: Colors.transparent,
        height: 95.h,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 26.w),
                child: CustomTextButton(
                    text: orderStatus, fontSize: 14.sp, onTap: () {}),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' رقم الطلب '
                  '# $orderID',
                  style: TextStyles.textstyle14,
                  //textdirection:isArabic() ? TextDirection.rtl : TextDirection.ltr,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'فريش بيف استربس',
                  style: TextStyles.textstyle12
                      .copyWith(color: ColorStyles.textGreyColor),
                  //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  '20/12/2022 الساعة 5:32 م',
                  style: TextStyles.textstyle12
                      .copyWith(color: ColorStyles.hintColor.withOpacity(0.4)),
                  //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '150.00 SR',
                  style: TextStyles.textstyle12
                      .copyWith(color: ColorStyles.hintColor.withOpacity(0.4)),
                ),
              ],
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Container(
                height: 80.h,
                width: 76.w,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AssetsData.productDetails,
                        )),
                    borderRadius: BorderRadius.circular(11)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
