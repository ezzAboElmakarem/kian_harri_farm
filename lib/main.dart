import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/Product_details/bloc/product_details_bloc.dart';
import 'package:kian_sheeps_projects/features/about_us/about_us_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/add_address_bloc.dart';
import 'package:kian_sheeps_projects/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:kian_sheeps_projects/features/addresses/bloc/addresses_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/coupon_bloc.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/categories_bloc.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/category_Items_bloc.dart';
import 'package:kian_sheeps_projects/features/common_Questions/bloc/common_ques_bloc.dart';
import 'package:kian_sheeps_projects/features/contact_us/bloc/Contact_us_bloc.dart';
import 'package:kian_sheeps_projects/features/delivery_and_shiping_terms/bloc/delivery_shipping_policy_bloc.dart';
import 'package:kian_sheeps_projects/features/favourities/bloc/favourite_bloc.dart';
import 'package:kian_sheeps_projects/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:kian_sheeps_projects/features/forget_password/views/forget_password_view.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/features/login/bloc/login_bloc.dart';
import 'package:kian_sheeps_projects/features/login/views/login_screen_view.dart';
import 'package:kian_sheeps_projects/features/notifications/bloc/notification_bloc.dart';
import 'package:kian_sheeps_projects/features/offers/bloc/all_offer_bloc.dart';
import 'package:kian_sheeps_projects/features/my_orders/bloc/order_bloc.dart';
import 'package:kian_sheeps_projects/features/order_details/bloc/order_details_bloc.dart';
import 'package:kian_sheeps_projects/features/payment/bloc/payment_bloc.dart';
import 'package:kian_sheeps_projects/features/privacy_Policy/bloc/privacy_policy_bloc.dart';
import 'package:kian_sheeps_projects/features/register/bloc/register_bloc.dart';
import 'package:kian_sheeps_projects/features/register/views/register_view.dart';
import 'package:kian_sheeps_projects/features/reset_password/bloc/reset_pass_bloc.dart';
import 'package:kian_sheeps_projects/features/return_and_exchange/bloc/exchange_policy_bloc.dart';
import 'package:kian_sheeps_projects/features/service_rate/bloc/service_rate_bloc.dart';
import 'package:kian_sheeps_projects/features/shipping_address/bloc/customer_address_bloc.dart';
import 'package:kian_sheeps_projects/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:kian_sheeps_projects/features/verify_code/views/vrefiy_code_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';
import 'features/verify_code/verify_code_bloc/verify_code_bloc.dart';
import 'helper/change_locale_method.dart';
import 'helper/color_styles.dart';
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
  AppLocaleLang appState = AppLocaleLang();

  @override
  Widget build(BuildContext context) {
    Network.lang = context.locale.languageCode;
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
                BlocProvider(
                  create: (context) => ForgetPasswordBLoc(),
                  child: const ForgetPasswordView(),
                ),
                BlocProvider(
                  create: (context) => VerifyCodeBLoc(),
                  child: const VerfiyCodeScreenView(),
                ),
                BlocProvider(
                  create: (context) => ResetPasswordBLoc(),
                ),
                BlocProvider(
                  create: (context) => HomeBloc()..add(Get()),
                ),
                BlocProvider(
                  create: (context) => AllOffersBloc(),
                ),
                BlocProvider(
                  create: (context) => CategoriesBloc(),
                ),
                BlocProvider(
                  create: (context) => CategoryItemsBloc(),
                ),
                BlocProvider(
                  create: (context) => NotificationBloc(),
                ),
                BlocProvider(
                  create: (context) => UpdateProfileBloc(),
                ),
                BlocProvider(
                  create: (context) => MyOrdersBloc(),
                ),
                BlocProvider(
                  create: (context) => MyOrdersDetailsBloc(),
                ),
                BlocProvider(
                  create: (context) => ServiceRateBloc(),
                ),
                BlocProvider(
                  create: (context) => ShippingPolicyBloc(),
                ),
                BlocProvider(
                  create: (context) => ExchangePolicyBloc(),
                ),
                BlocProvider(
                  create: (context) => PrivacyPolicyBloc(),
                ),
                BlocProvider(
                  create: (context) => CommonQuestionsBloc(),
                ),
                BlocProvider(
                  create: (context) => FavouriteBloc(),
                ),
                BlocProvider(
                  create: (context) => AboutUsBloc(),
                ),
                BlocProvider(
                  create: (context) => AddressesBloc(),
                ),
                BlocProvider(
                  create: (context) => AddAddressBloc(),
                ),
                BlocProvider(
                  create: (context) => CitiesAndRegionsBloc(),
                ),
                BlocProvider(
                  create: (context) => ContactUsBloc(),
                ),
                BlocProvider(
                  create: (context) => ProductDetailsBloc(),
                ),
                BlocProvider(
                  create: (context) => CartBloc(),
                ),
                BlocProvider(
                  create: (context) => CouponBloc(),
                ),
                BlocProvider(
                  create: (context) => CustomerAddressBloc(),
                ),
                BlocProvider(
                  create: (context) => PaymentBloc(),
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
                navigatorKey: navigatorKey,
                onGenerateRoute: onGenerateRoute,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: const [
                  Locale('ar'),
                  Locale('en'),
                ],
                locale: context.locale,
                home: HomeView(),
              ),
            ),
          );
        });
  }
}
