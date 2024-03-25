import 'package:flutter/material.dart';

class AppState {
  Locale currentLocale = const Locale('en', 'US');

  void changeLocale(Locale newLocale) {
    currentLocale = newLocale;
  }
}
