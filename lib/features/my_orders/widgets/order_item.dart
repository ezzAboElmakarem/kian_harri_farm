import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../order_details/views/order_details_view.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';
import '../../../widgets/custom_text_button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key,
      required this.orderStatus,
      required this.orderID,
      required this.name,
      required this.date,
      required this.price});
  final String orderStatus;
  final int orderID;
  final String name;
  final String date;

  final String price;
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
        // height: 95.h,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 85.h,
              width: 76.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AssetsData.productDetails,
                      )),
                  borderRadius: BorderRadius.circular(11)),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${'order_num'.tr()} # $orderID',
                    style: TextStyles.textstyle14,
                    //textdirection:isArabic() ? TextDirection.rtl : TextDirection.ltr,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  name == ''
                      ? const SizedBox()
                      : Text(
                          name,
                          style: TextStyles.textstyle12
                              .copyWith(color: ColorStyles.textGreyColor),
                          //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                        ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    date,
                    style: TextStyles.textstyle12.copyWith(
                        fontSize: 11.sp,
                        color: ColorStyles.hintColor.withOpacity(0.4)),
                    //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        ' SR',
                        style: TextStyles.textstyle12.copyWith(
                            color: ColorStyles.hintColor.withOpacity(0.4)),
                      ),
                      Text(
                        price,
                        style: TextStyles.textstyle12.copyWith(
                            color: ColorStyles.hintColor.withOpacity(0.4)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.w,
                  right: 2.w,
                ),
                child: CustomTextButton(
                    text: orderStatus, fontSize: 14.sp, onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
