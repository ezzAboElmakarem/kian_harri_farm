import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 160.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50.sp),
                child: Image.asset(AssetsData.successImage),
              ),
              Text(
                'تم ارسال الطلب بنجاح',
                style: TextStyles.textstyle16,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      buttonText: 'طلباتي',
                      textColor: Colors.white,
                      onTap: () {
                        navigateTo(context: context, widget: const CartView());
                      },
                      width: 160.w),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomButton(
                      buttonText: "الرئيسية",
                      onTap: () {
                        navigateTo(context: context, widget: HomeView());
                      },
                      width: 160.w,
                      buttonColor: ColorStyles.textFormFieldfillColor,
                      textColor: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
