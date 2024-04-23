import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:kian_sheeps_projects/features/addresses/bloc/addresses_bloc.dart';
import 'package:kian_sheeps_projects/features/addresses/widgets/addresses_card.dart';
import 'package:kian_sheeps_projects/features/notifications/views/empty_notification_view.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import '../../add_address/views/add_address_view.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';

class AddressesListView extends StatelessWidget {
  const AddressesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'addresses'.tr()),
      body: BlocBuilder<AddressesBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Empty) {
            return const EmptyNotificationView();
          } else if (state is Done) {
            var bloc = AddressesBloc.of(context);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {
                      CitiesAndRegionsBloc.of(context).add(Get());

                      navigateTo(
                          context: context, widget: const AddAddressView());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AssetsData.maximizeIcon),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'add_new_address'.tr(),
                          style: TextStyles.textstyle14
                              .copyWith(fontSize: 13.sp, color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      itemBuilder: (context, index) => AddressesCard(
                            addressdata: bloc.addressesData.addresses![index],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16.w,
                          ),
                      itemCount: bloc.addressesData.addresses?.length ?? 0),
                  SizedBox(height: 40.h),
                ],
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
