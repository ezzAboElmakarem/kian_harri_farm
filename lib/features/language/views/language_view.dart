import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/categories/widgets/custom_radio_tile_item.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';
import 'package:kian_sheeps_projects/helper/change_locale_method.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/custom_button.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key, required this.appState});
  final AppState appState;

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
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
      appBar: customAppBar(context: context, title: 'اللغة'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                    });
                    widget.appState.changeLocale(const Locale('ar', 'EG'));
                    setState(() {});
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
              buttonText: S.of(context).confirm,
              onTap: () {
                widget.appState.changeLocale(const Locale('ar', 'EG'));
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.appState});
  final AppState appState;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
