import 'package:easy_localization/easy_localization.dart';
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
          title: 'name'.tr(),
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'phone'.tr(),
          type: TextInputType.phone,
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: 'extra_phone'.tr(),
          type: TextInputType.phone,
        ),
        SizedBox(height: 10.h),
        const CountryDropDown(
          fieldTitle: 'المنطقة',
          dataList: [
            'الترعة',
            'الجلاء',
            'الاستاد ',
            'جديله',
          ],
        ),
        SizedBox(height: 10.h),
        const CountryDropDown(
          fieldTitle: 'المدينة',
          dataList: [
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
