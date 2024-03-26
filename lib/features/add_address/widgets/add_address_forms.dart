import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shipping_address/widgets/select_city.dart';
import '../../shipping_address/widgets/shipping_address.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';
import '../../../widgets/custom_tex_form_field.dart';

class AddAddressForms extends StatelessWidget {
  const AddAddressForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
