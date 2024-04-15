import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:kian_sheeps_projects/features/update_profile/model/update_profile_model.dart';
import '../../../widgets/custom_tex_form_field.dart';

class SettingsForms extends StatelessWidget {
  const SettingsForms({
    super.key,
    required this.userData,
  });
  final UpdateProfileModel userData;
  @override
  Widget build(BuildContext context) {
    var bloc = UpdateProfileBloc.get(context);
    return Column(
      children: [
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "name".tr(),
          hint: userData.data!.name,
          controller: bloc.name,
          type: TextInputType.name,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "phone".tr(),
          hint: userData.data!.phone,
          controller: bloc.phone,
          type: TextInputType.phone,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          ispassword: false,
          isEnabled: true,
          title: "email".tr(),
          hint: userData.data!.email,
          controller: bloc.email,
          type: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 10.h,
        ),
        // CustomTextFormField(
        //   ispassword: true,
        //   isEnabled: true,
        //   title: "password".tr(),
        //   hint: '***********',
        //   controller: bloc.password,
        // ),
      ],
    );
  }
}
