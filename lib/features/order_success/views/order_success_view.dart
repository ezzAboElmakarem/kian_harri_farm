import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/views/home_view.dart';
import '../../my_orders/views/orders_tapbar.dart';
import '../../../helper/assets.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';
import '../../../widgets/custom_button.dart';

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
                        navigateTo(
                            context: context, widget: const OrdersTabBar());
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
