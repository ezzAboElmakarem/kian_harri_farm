import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/service_rate/bloc/service_rate_bloc.dart';
import 'package:kian_sheeps_projects/features/service_rate/widgets/service_rating_widget.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_tex_form_field.dart';

class ServiceRateBody extends StatelessWidget {
  const ServiceRateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = ServiceRateBloc.of(context);
    return Column(
      children: [
        SizedBox(
          height: 14.h,
        ),
        ServiceRatingWidget(
          service: 'الطلب',
          onRateUpdate: (rating) {
            bloc.fillBody(order: rating.toString());

            log("order rate is $rating");
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        ServiceRatingWidget(
          service: 'الخدمة',
          onRateUpdate: (rating) {
            bloc.fillBody(service: rating.toString());

            log("service rate is $rating");
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        ServiceRatingWidget(
          service: 'سرعة التوصيل',
          onRateUpdate: (rating) {
            bloc.fillBody(deliverySpeed: rating.toString());

            log("delivery speed rate is $rating");
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        ServiceRatingWidget(
          service: 'مامدى شعورك بالرضا',
          onRateUpdate: (rating) {
            bloc.fillBody(satisfaction: rating.toString());

            log("satsfaction rate is $rating");
          },
        ),
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
          onChange: (comment) {
            bloc.fillBody(comment: comment.toString());
          },
        ),
      ],
    );
  }
}
