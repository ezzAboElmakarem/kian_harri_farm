import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
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
          child: Row(
            children: [
              Text(
                '$price ر.س',
                textDirection: TextDirection.rtl,
                style: TextStyles.textstyle16.copyWith(color: Colors.white),
              ),
              const Spacer(),
              Text(
                'اضف للسله',
                textDirection: TextDirection.rtl,
                style: TextStyles.textstyle16.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    navigateTo(context: context, widget: const CartView());
                  },
                  child: Image.asset(AssetsData.shoppingBasket,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
