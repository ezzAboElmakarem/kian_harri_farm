import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../payment/views/payment_view.dart';
import '../widgets/shipping_address.dart';
import '../widgets/select_city.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_tex_form_field.dart';

class CustomerAddressView extends StatelessWidget {
  const CustomerAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'العنوان',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'الأسم',
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'رقم الجوال',
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: ' رقم جوال اضافي',
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'العنوان بالتفصيل',
              ),
              SizedBox(height: 10.h),
//*******************************************************************************************************
              const CountryDropDown(
                fieldTitle: 'المدينة',
                dataList: [
                  'المحلة',
                  'المنصورة',
                  'القاهرة ',
                  'الجيزة',
                ],
              ),
//*******************************************************************************************************

              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'الحي',
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'اسم الشارع',
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'رقم السكن',
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  navigateTo(context: context, widget: const ShippingAddress());
                  log('$args');
                },
                child: CustomTextFormField(
                  ispassword: false,
                  isEnabled: false,
                  title: 'تحديد موقع الاستلام على الخريطة',
                  controller: TextEditingController(text: args),
                  prefixIcon: Image.asset(AssetsData.arrowPointer),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'اضف ملاحظات على الطلب',
                maxLines: 6,
              ),
              SizedBox(height: 40.h),
              CustomButton(
                  buttonText: 'التالي',
                  onTap: () {
                    navigateTo(context: context, widget: const PaymentView());
                  }),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
