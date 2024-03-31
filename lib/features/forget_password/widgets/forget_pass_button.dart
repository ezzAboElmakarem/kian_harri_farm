import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = ForgetPasswordBLoc.get(context);

    return BlocBuilder<ForgetPasswordBLoc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        } else {
          return CustomButton(
            buttonText: 'send_code'.tr(),
            onTap: () {
              bloc.add(Click());
            },
            textColor: null,
          );
        }
      },
    );
  }
}
