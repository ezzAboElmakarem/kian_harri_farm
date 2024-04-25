import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/features/splash_screen/views/splash_screen_view.dart';
import 'package:kian_sheeps_projects/helper/color_styles.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/change_locale_method.dart';
import '../../../widgets/custom_button.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key, required this.appState});
  final AppLocaleLang appState;

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late String _selectedLocale;
  // ValueNotifier<int> selectedValue = ValueNotifier<int>(0);

  late final GetStorage _storage;

  @override
  void initState() {
    _storage = GetStorage();
    _selectedLocale =
        _storage.read('selectedLocale') ?? (RouteUtils.isAR ? "ar" : "en");
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
                  _storage.write('selectedLocale', 'ar');
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
                  _storage.write('selectedLocale', 'en');
                });
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              buttonText: "confirm".tr(),
              onTap: () {
                setState(() {
                  context.setLocale(Locale(_selectedLocale));
                  _storage.write('selectedLocale', _selectedLocale);

                  final rootElement =
                      WidgetsFlutterBinding.ensureInitialized().rootElement!;
                  WidgetsBinding.instance.buildOwner!.reassemble(rootElement);
                  log(_selectedLocale);
                  RouteUtils.navigateAndPopAll(const SplashScreenView());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
