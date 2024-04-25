import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/contact_us/bloc/contact_us_bloc.dart';
import 'package:kian_sheeps_projects/helper/validations.dart';
import '../../../widgets/custom_tex_form_field.dart';

class ContactUsForms extends StatelessWidget {
  const ContactUsForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, AppState>(
      builder: (context, state) {
        var bloc = ContactUsBloc.of(context);
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: Text('error_getting_data'.tr()));
        } else {
          return Form(
            key: bloc.formkey,
            child: Column(
              children: [
                CustomTextFormField(
                  ispassword: false,
                  isEnabled: true,
                  title: "name".tr(),
                  controller: bloc.name,
                  validation: Validator.name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  ispassword: false,
                  isEnabled: true,
                  title: "phone".tr(),
                  type: TextInputType.phone,
                  controller: bloc.phone,
                  validation: Validator.phone,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  ispassword: false,
                  isEnabled: true,
                  title: "email".tr(),
                  controller: bloc.email,
                  type: TextInputType.emailAddress,
                  validation: Validator.email,
                ),
                CustomTextFormField(
                  ispassword: false,
                  isEnabled: true,
                  maxLines: 5,
                  title: "messeage_text".tr(),
                  hint: "messeage_hint_text".tr(),
                  controller: bloc.message,
                  validation: Validator.empty,
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
