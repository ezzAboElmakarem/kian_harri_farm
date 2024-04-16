import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/about_us/about_us_bloc.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';
import '../../../helper/text_styles.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "about_us".tr()),
      body: BlocBuilder<AboutUsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = AboutUsBloc.of(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bloc.aboutUsData.data!.about ?? "about_us_body".tr(),
                      style: TextStyles.textstyle16
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "our_vision".tr(),
                      style:
                          TextStyles.textstyle20.copyWith(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      bloc.aboutUsData.data!.ourVision ?? "about_us_body".tr(),
                      style: TextStyles.textstyle16
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "our_message".tr(),
                      style:
                          TextStyles.textstyle20.copyWith(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      bloc.aboutUsData.data!.ourMesages ?? "about_us_body".tr(),
                      style: TextStyles.textstyle16
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "our_values".tr(),
                      style:
                          TextStyles.textstyle20.copyWith(color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      bloc.aboutUsData.data!.ourValues ?? "about_us_body".tr(),
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
