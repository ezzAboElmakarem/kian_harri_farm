import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/features/register/widgets/register_buttons.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';
import '../widgets/register_forms.dart';
import '../widgets/accept_terms_widgets.dart';
import '../../../widgets/background_decoration.dart';
import '../../../widgets/logo_and_screen_title.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, AppState>(
      listener: (context, state) {
        if (state is Error) {
          showSnackBar(context, "catch an error ==>${state.errorMsg}");
        }
      },
      child: Scaffold(
        body: DecoratedBackGround(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoAndScreenTitle(
                      screenTitle: 'new_login'.tr(),
                    ),
                    const RegisterForms(),
                    SizedBox(
                      height: 24.h,
                    ),
                    const AcceptTermsWidget(),
                    SizedBox(
                      height: 45.h,
                    ),
                    const RegisterButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
