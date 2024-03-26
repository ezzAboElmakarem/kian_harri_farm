import 'package:flutter/material.dart';

class AppState {
  Locale currentLocale = const Locale('en');

  void changeLocale(Locale newLocale) {
    currentLocale = newLocale;
  }
}
