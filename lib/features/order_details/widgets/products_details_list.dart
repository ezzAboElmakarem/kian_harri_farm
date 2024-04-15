import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/order_details/model/order_details_model.dart';
import 'product_details_item.dart';
import '../../service_rate/views/service_rate.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';
import '../../../widgets/custom_text_button.dart';

class ProductsDetailsList extends StatelessWidget {
  const ProductsDetailsList({
    super.key,
    required this.orderID,
    required this.orderDetailsModel,
  });

  final int orderID;
  final MyOrderDetailsModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'رقم الطلب '
                '# $orderID ',
                style: TextStyles.textstyle14,
                //textdirection:isArabic() ? TextDirection.rtl : TextDirection.ltr,
              ),
              const Spacer(),
              CustomTextButton(
                  text: 'تقييم الخدمة',
                  onTap: () {
                    navigateTo(
                        context: context,
                        widget: ServiceRateView(
                          myOrderDetailsModel: orderDetailsModel,
                        ));
                    log('message');
                  }),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ProductDetailsItem(
                  offer: orderDetailsModel.data!.offers![index]),
              separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Divider(
                      height: 2.0,
                      thickness: 2.0,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
              itemCount: orderDetailsModel.data!.offers!.length)
        ],
      ),
    );
  }
}
