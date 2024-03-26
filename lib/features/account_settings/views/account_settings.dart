import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/settings_buttons.dart';
import '../widgets/settings_forms.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/assets.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "account_settings".tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(AssetsData.greenCircle),
                  Positioned(
                      top: 14.h,
                      right: 14.w,
                      left: 14.w,
                      child: Image.asset(AssetsData.personIcon)),
                ],
              ),
              const SettingsForms(),
              SizedBox(
                height: 50.h,
              ),
              const SettingsButtons(),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
