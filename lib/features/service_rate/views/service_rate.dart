import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/service_rating_widget.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_tex_form_field.dart';

class ServiceRateView extends StatelessWidget {
  const ServiceRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'تقييم الخدمة'),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 14.h,
            ),
            const ServiceRatingWidget(service: 'الطلب'),
            SizedBox(
              height: 12.h,
            ),
            const ServiceRatingWidget(service: 'الخدمة'),
            SizedBox(
              height: 12.h,
            ),
            const ServiceRatingWidget(service: 'سرعة التوصيل'),
            SizedBox(
              height: 12.h,
            ),
            const ServiceRatingWidget(service: 'مامدى شعورك بالرضا'),
            SizedBox(
              height: 28.h,
            ),
            CustomTextFormField(
              ispassword: false,
              isEnabled: true,
              maxLines: 6,
              fillColor: Colors.white,
              hint: 'اضف ملاحظاتك هنا',
              hintColor: Colors.black,
              borderColor: kPrimaryColor,
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(buttonText: 'متابعة', onTap: () {}),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      )),
    );
  }
}
