import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/contact_us/bloc/contact_us_bloc.dart';
import '../../../widgets/custom_button.dart';

class ContuctUsButton extends StatelessWidget {
  const ContuctUsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return CustomButton(
              buttonText: "send".tr(),
              onTap: () {
                ContactUsBloc.of(context).add(Click());
              });
        } else if (state is Done) {
          return CustomButton(
              buttonText: "send".tr(),
              onTap: () {
                ContactUsBloc.of(context).add(Click());
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
