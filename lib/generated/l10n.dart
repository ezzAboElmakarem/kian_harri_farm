// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welc,ome Again`
  String get welcome_text {
    return Intl.message(
      'Welc,ome Again',
      name: 'welcome_text',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Email \ Phone `
  String get email_or_phone {
    return Intl.message(
      'Email \\ Phone ',
      name: 'email_or_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget_password {
    return Intl.message(
      'Forget Password ?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Check App Without Login`
  String get vistor_button {
    return Intl.message(
      'Check App Without Login',
      name: 'vistor_button',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have Account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t Have Account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_button {
    return Intl.message(
      'Login',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `All Of Your Product Are Avilable`
  String get welcome_body_text {
    return Intl.message(
      'All Of Your Product Are Avilable',
      name: 'welcome_body_text',
      desc: '',
      args: [],
    );
  }

  /// `Search For Products`
  String get search_hint {
    return Intl.message(
      'Search For Products',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get show_more {
    return Intl.message(
      'Show more',
      name: 'show_more',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Remove Account`
  String get remove_account {
    return Intl.message(
      'Remove Account',
      name: 'remove_account',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of text that can be replaced in the same space. This text was generated from the Arabic text generator, where you can generate such text or many other texts in addition to increasing the number of letters that the application generates.`
  String get about_us_body {
    return Intl.message(
      'This text is an example of text that can be replaced in the same space. This text was generated from the Arabic text generator, where you can generate such text or many other texts in addition to increasing the number of letters that the application generates.',
      name: 'about_us_body',
      desc: '',
      args: [],
    );
  }

  /// `Our Vision`
  String get our_vision {
    return Intl.message(
      'Our Vision',
      name: 'our_vision',
      desc: '',
      args: [],
    );
  }

  /// `Our Messae`
  String get our_message {
    return Intl.message(
      'Our Messae',
      name: 'our_message',
      desc: '',
      args: [],
    );
  }

  /// `Our Values`
  String get our_values {
    return Intl.message(
      'Our Values',
      name: 'our_values',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contact_us {
    return Intl.message(
      'Contact us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Message Text`
  String get messeage_text {
    return Intl.message(
      'Message Text',
      name: 'messeage_text',
      desc: '',
      args: [],
    );
  }

  /// `leave your message here`
  String get messeage_hint_text {
    return Intl.message(
      'leave your message here',
      name: 'messeage_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Contact us also`
  String get contuct_us_also {
    return Intl.message(
      'Contact us also',
      name: 'contuct_us_also',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Delivry & Shipping Terms`
  String get shipping_terms {
    return Intl.message(
      'Delivry & Shipping Terms',
      name: 'shipping_terms',
      desc: '',
      args: [],
    );
  }

  /// `Return And Exchange`
  String get return_and_exchange {
    return Intl.message(
      'Return And Exchange',
      name: 'return_and_exchange',
      desc: '',
      args: [],
    );
  }

  /// `When is the exchange and return available`
  String get exchange_time {
    return Intl.message(
      'When is the exchange and return available',
      name: 'exchange_time',
      desc: '',
      args: [],
    );
  }

  /// `This text is an example of text that can be replaced in the same space. This text was generated from the Arabic text generator, where you can generate such text or many other texts in addition to increasing the number of letters that the application generates.`
  String get exchange_time_anwser {
    return Intl.message(
      'This text is an example of text that can be replaced in the same space. This text was generated from the Arabic text generator, where you can generate such text or many other texts in addition to increasing the number of letters that the application generates.',
      name: 'exchange_time_anwser',
      desc: '',
      args: [],
    );
  }

  /// `Common Questions`
  String get common_questions_title {
    return Intl.message(
      'Common Questions',
      name: 'common_questions_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
