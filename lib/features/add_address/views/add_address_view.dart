import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/add_address/widgets/add_address_forms.dart';
import 'package:kian_sheeps_projects/features/add_address/widgets/confirm_button.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'اضافة عنوان'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddAddressForms(),
              CofirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}
