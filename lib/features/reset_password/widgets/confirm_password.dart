import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/reset_password/bloc/reset_pass_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = ResetPasswordBLoc.get(context);

    return BlocBuilder<ResetPasswordBLoc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        } else {
          return CustomButton(
            buttonText: "confirm".tr(),
            textColor: null,
            onTap: () {
              bloc.add(Click());
            },
          );
        }
      },
    );
  }
}
