import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class CustomerAddressView extends StatelessWidget {
  const CustomerAddressView({super.key});

  @override
  Widget build(BuildContext context) {
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
              const CountryDropDown(),
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
              CustomTextFormField(
                ispassword: false,
                isEnabled: false,
                title: 'تحديد موقع الاستلام على الخريطة',
                prefixIcon: Image.asset(AssetsData.arrowPointer),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                title: 'اضف ملاحظات على الطلب',
                maxLines: 6,
              ),
              SizedBox(height: 40.h),
              CustomButton(buttonText: 'التالي', onTap: () {}),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryDropDown extends StatelessWidget {
  const CountryDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      ispassword: false,
      isEnabled: true,
      title: 'المدينة',
    );
  }
}
