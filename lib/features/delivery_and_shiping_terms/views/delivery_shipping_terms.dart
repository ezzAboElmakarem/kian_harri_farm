import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/delivery_and_shiping_terms/bloc/delivery_shipping_policy_bloc.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/text_styles.dart';

class DeliveryAndShippingTermsView extends StatelessWidget {
  const DeliveryAndShippingTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "shipping_terms".tr()),
      body: BlocBuilder<ShippingPolicyBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = ShippingPolicyBloc.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    Text(
                      // "${"about_us_body".tr()}\n \n ${"about_us_body".tr()}",
                      bloc.shippingPolicyData.data?.title ?? '',
                      style: TextStyles.textstyle16
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
