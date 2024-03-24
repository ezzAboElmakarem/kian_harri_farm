import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/add_address/views/add_address_view.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/navigation_methods.dart';
import 'package:kian_sheeps_projects/widgets/custom_text_button.dart';
import 'package:kian_sheeps_projects/widgets/delivery_summary.dart';

class AddressesListView extends StatelessWidget {
  const AddressesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'العناوين'),
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
                  CustomTextButton(
                    text: 'اضافة عنوان اخر',
                    fontSize: 13.sp,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Image.asset(AssetsData.maximizeIcon)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
