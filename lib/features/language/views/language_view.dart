import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../categories/widgets/custom_radio_tile_item.dart';
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
  String _selectedLocale = "ar";

  String selectedOption = '';
  List<String> typeOptions = [
    'العربية',
    'English',
  ];
  @override
  void initState() {
    selectedOption = typeOptions[0];

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
            SizedBox(
              height: 160.h,
              width: double.infinity,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CustomRadioTileItem(
                  title: typeOptions[index],
                  groupValue: selectedOption,
                  value: typeOptions[index],
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                      if (typeOptions[index] == 'English') {
                        _selectedLocale = 'en';
                      } else {
                        _selectedLocale = 'ar';
                      }
                    });
                  },
                  selected: selectedOption == typeOptions[index],
                ),
                itemCount: typeOptions.length,
              ),
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
