import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/account_settings/widgets/settings_buttons.dart';
import 'package:kian_sheeps_projects/features/account_settings/widgets/settings_forms.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, title: S.of(context).account_settings),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(AssetsData.greenCircle),
                  // Image.asset(AssetsData.personIcon),
                ],
              ),
              const SettingsForms(),
              SizedBox(
                height: 50.h,
              ),
              const SettingsButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
