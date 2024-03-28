import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/features/login/bloc/login_bloc.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/features/register/views/register_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'helper/change_locale_method.dart';
import 'helper/color_styles.dart';
import 'features/splash_screen/views/splash_screen_view.dart';
import 'helper/keyboard_close_observer.dart';

Locale currentLocale = const Locale('en', 'US');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Future.value([
    await EasyLocalization.ensureInitialized(),
    // await Firebase.initializeApp(),
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return KeyboardPopScaffold(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterBloc(),
                  child: const RegisterView(),
                ),
                BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const LoginScreenView(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  fontFamily: 'Cairo',
                  colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
                  useMaterial3: true,
                ),
                home: const SplashScreenView(),
                navigatorKey: navigatorKey,
                onGenerateRoute: onGenerateRoute,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: const [
                  Locale('ar'),
                  Locale('en'),
                ],
                locale: context.locale,
              ),
            ),
          );
        });
  }
}
