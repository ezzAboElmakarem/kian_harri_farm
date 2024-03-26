import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckLocale {
  final BuildContext context;

  CheckLocale(this.context);

  bool isArabicLocale() {
    return EasyLocalization.of(context)!.locale.languageCode == 'ar';
  }
}
