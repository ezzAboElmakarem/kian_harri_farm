import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import '../../add_address/views/add_address_view.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';
import '../../../helper/navigation_methods.dart';
import '../../../helper/text_styles.dart';
import '../../../widgets/delivery_summary.dart';

class AddressesListView extends StatelessWidget {
  const AddressesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'adresses'.tr()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                itemBuilder: (context, index) =>
                    const DeliverySummary(isEditing: true),
                separatorBuilder: (context, index) => SizedBox(
                      height: 16.w,
                    ),
                itemCount: 3),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
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
          ],
        ),
      ),
    );
  }
}
