import 'package:flutter/material.dart';

class AppLocaleLang {
  Locale currentLocale = const Locale('en');

  void changeLocale(Locale newLocale) {
    currentLocale = newLocale;
  }
}
