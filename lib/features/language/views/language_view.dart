import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/change_locale_method.dart';
import '../../../widgets/custom_button.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key, required this.appState});
  final AppState appState;

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late String _selectedLocale;
  // ValueNotifier<int> selectedValue = ValueNotifier<int>(0);

  @override
  void initState() {
    _selectedLocale = RouteUtils.isAR ? "ar" : "en";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'language'.tr()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              title: const Text('العربية'),
              value: 0,
              groupValue: _selectedLocale == "ar" ? 0 : 1,
              onChanged: (value) {
                setState(() {
                  _selectedLocale = 'ar';
                });
              },
            ),
            RadioListTile(
              activeColor: kPrimaryColor,
              title: const Text('English'),
              value: 1,
              groupValue: _selectedLocale == "en" ? 1 : 0,
              onChanged: (value) {
                setState(() {
                  _selectedLocale = 'en';
                });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              buttonText: "confirm".tr(),
              onTap: () {
                context.setLocale(Locale(_selectedLocale));
                final rootElement =
                    WidgetsFlutterBinding.ensureInitialized().rootElement!;
                WidgetsBinding.instance.buildOwner!.reassemble(rootElement);
                log(_selectedLocale);
              },
            ),
          ],
        ),
      ),
    );
  }
}
