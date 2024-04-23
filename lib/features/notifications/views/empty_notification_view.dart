import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/views/add_address_view.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import '../../../helper/assets.dart';
import '../../../helper/text_styles.dart';

class EmptyNotificationView extends StatelessWidget {
  const EmptyNotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () {
              CitiesAndRegionsBloc.of(context).add(Get());

              navigateTo(context: context, widget: const AddAddressView());
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
          SizedBox(
            height: 60.h,
          ),
          Image.asset(AssetsData.noNotificationImage),
          Text(
            'لا توجد اشعارات ابدأ باستخدام التطبيق',
            style: TextStyles.textstyle16.copyWith(fontWeight: FontWeight.w400),
            //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
