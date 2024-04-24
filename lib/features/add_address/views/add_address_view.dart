import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:kian_sheeps_projects/widgets/empty_data_view.dart';
import '../widgets/add_address_forms.dart';
import '../widgets/add_address_button.dart';
import '../../../helper/app_bar_method.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'address'.tr()),
      body: BlocBuilder<CitiesAndRegionsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Empty) {
            return const EmptyDataScreen();
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = CitiesAndRegionsBloc.of(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddAddressForms(
                        citiesData: bloc.citiesData,
                        regionData: bloc.regionsData),
                    const AddAddressButton(),
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
