import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/service_rate/bloc/service_rate_bloc.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class RatingContinueButton extends StatelessWidget {
  final String orderId;

  const RatingContinueButton({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRateBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (State is Done) {
          return CustomButton(
            buttonText: 'متابعة',
            onTap: () {
              ServiceRateBloc.of(context).add(Click(arguments: orderId));
            },
          );
        } else {
          return CustomButton(
            buttonText: 'متابعة',
            onTap: () {
              ServiceRateBloc.of(context).add(Click(arguments: orderId));
            },
          );
        }
      },
    );
  }
}
