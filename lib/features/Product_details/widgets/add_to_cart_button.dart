import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cart/views/cart_view.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.price,
  });
  final int price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 66.h,
        width: 324.w,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: GestureDetector(
            onTap: () {
              navigateTo(context: context, widget: const CartView());
            },
            child: Row(
              children: [
                Image.asset(AssetsData.shoppingBasket,
                    height: 24.h, width: 24.w, color: Colors.white),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "add_to_cart".tr(),
                  //     //textdirection: TextDirection.rtl,
                  style: TextStyles.textstyle16.copyWith(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  '$price ر.س',
                  //   //textdirection: TextDirection.rtl,
                  style: TextStyles.textstyle16.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
