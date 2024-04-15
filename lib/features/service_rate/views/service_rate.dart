// ignore_for_file: unused_import

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/order_details/model/order_details_model.dart';
import 'package:kian_sheeps_projects/features/service_rate/bloc/service_rate_bloc.dart';
import 'package:kian_sheeps_projects/features/service_rate/widgets/service_rate_body.dart';
import 'package:kian_sheeps_projects/features/service_rate/widgets/service_rate_button.dart';
import '../../../helper/app_bar_method.dart';
import '../../../widgets/custom_button.dart';

class ServiceRateView extends StatelessWidget {
  final MyOrderDetailsModel myOrderDetailsModel;

  const ServiceRateView({
    super.key,
    required this.myOrderDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'تقييم الخدمة'),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const ServiceRateBody(),
            SizedBox(
              height: 40.h,
            ),
            RatingContinueButton(
              orderId: myOrderDetailsModel.data?.id.toString() ?? "",
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      )),
    );
  }
}
