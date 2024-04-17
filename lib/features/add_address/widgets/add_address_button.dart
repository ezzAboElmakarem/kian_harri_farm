import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/add_address_bloc.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import '../../../widgets/custom_button.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAddressBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        } else if (state is Error) {
          return CustomButton(
            buttonText: 'حفظ',
            onTap: () {
              AddAddressBloc.of(context).add(Click());
            },
          );
        } else {}
        return CustomButton(
          buttonText: 'حفظ',
          onTap: () {
            AddAddressBloc.of(context).add(Click());
          },
        );
      },
    );
  }
}
