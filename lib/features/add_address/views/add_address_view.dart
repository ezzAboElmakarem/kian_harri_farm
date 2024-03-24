import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/shipping_address/widgets/select_city.dart';
import 'package:kian_sheeps_projects/features/shipping_address/widgets/shipping_address.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'اضافة عنوان'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                type: TextInputType.phone,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: ' رقم جوال اضافي',
                type: TextInputType.phone,
              ),
              SizedBox(height: 10.h),
              CountryDropDown(
                fieldTitle: 'المنطقة',
                dataList: const [
                  'الترعة',
                  'الجلاء',
                  'الاستاد ',
                  'جديله',
                ],
              ),
              SizedBox(height: 10.h),
              CountryDropDown(
                fieldTitle: 'المدينة',
                dataList: const [
                  'المحلة',
                  'المنصورة',
                  'القاهرة ',
                  'الجيزة',
                ],
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: "الحي",
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'رقم السكن',
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'ملاحظات',
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  navigateTo(context: context, widget: const ShippingAddress());
                },
                child: CustomTextFormField(
                  ispassword: false,
                  isEnabled: false,
                  title: 'تحديد موقع الاستلام على الخريطة',
                  prefixIcon: Image.asset(AssetsData.arrowPointer),
                ),
              ),
              SizedBox(height: 50.h),
              CustomButton(buttonText: 'حفظ', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
