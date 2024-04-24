import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/empty_data_view.dart';
import '../widgets/update_profile_buttons.dart';
import '../widgets/settings_forms.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "account_settings".tr()),
      body: BlocBuilder<UpdateProfileBloc, AppState>(
        builder: (context, state) {
          final bloc = UpdateProfileBloc.get(context);

          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Empty) {
            return const EmptyDataScreen();
          } else if (state is Error) {
            return Center(
                child: Text(
              "error_getting_data".tr(),
              style: TextStyles.textstyle16,
            ));
          } else if (state is Done) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset(AssetsData.greenCircle),
                        Positioned(
                            top: 14.h,
                            right: 14.w,
                            left: 14.w,
                            child: Image.asset(AssetsData.personIcon)),
                      ],
                    ),
                    SettingsForms(
                      userData: bloc.userData,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    const UpdateProfileButtons(),
                    SizedBox(
                      height: 40.h,
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
