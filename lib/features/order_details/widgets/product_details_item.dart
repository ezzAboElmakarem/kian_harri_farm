import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/order_details/model/order_details_model.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key, required this.offer});
  final Offers offer;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                offer.name!,
                style: TextStyles.textstyle12
                    .copyWith(color: ColorStyles.textGreyColor),
                //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                offer.quantity.toString(),
                style: TextStyles.textstyle12
                    .copyWith(color: ColorStyles.hintColor.withOpacity(0.4)),
                //textdirection:  isArabic() ? TextDirection.rtl : TextDirection.ltr,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    'SR',
                    style: TextStyles.textstyle12.copyWith(
                        color: ColorStyles.hintColor.withOpacity(0.4)),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    offer.price.toString(),
                    style: TextStyles.textstyle12.copyWith(
                        color: ColorStyles.hintColor.withOpacity(0.4)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
