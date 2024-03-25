import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/about_us/views/about_us_view.dart';
import 'package:kian_sheeps_projects/features/account_settings/views/account_settings.dart';
import 'package:kian_sheeps_projects/features/addresses/views/addresses_list_view.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/features/common_Questions/views/common_questions.dart';
import 'package:kian_sheeps_projects/features/contact_us/views/contact_us.dart';
import 'package:kian_sheeps_projects/features/drawer/widgets/drawer_section_item.dart';
import 'package:kian_sheeps_projects/features/favourities/views/favourities_view.dart';
import 'package:kian_sheeps_projects/features/language/views/language_view.dart';
import 'package:kian_sheeps_projects/features/notifications/views/notifications_view.dart';
import 'package:kian_sheeps_projects/features/orders/views/orders_tapbar.dart';
import 'package:kian_sheeps_projects/features/privacy_Pollicy/views/privacy_Policy_rename.dart';
import 'package:kian_sheeps_projects/features/delivery_and_shiping_terms/views/delivery_shipping_terms.dart';
import 'package:kian_sheeps_projects/features/return_and_exchange/views/return_and_exchange_view.dart';
import 'package:kian_sheeps_projects/features/terms_and_conditions/views/terms_and_conditions.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/change_locale_method.dart';
import 'package:kian_sheeps_projects/widgets/logo_image_widget.dart';

// ignore: must_be_immutable
class DrawerView extends StatelessWidget {
  DrawerView({super.key});

  List<Map<String, dynamic>> drawerItems = [
    {
      "imagePath": AssetsData.settingsImage,
      "title": 'إعدادات الحساب',
      "widget": const AccountSettings(),
    },
    {
      "imagePath": AssetsData.shoppingBagIcon,
      "title": 'طلباتى',
      "widget": const OrdersTabBar(),
    },
    {
      "imagePath": AssetsData.emptyHeartIcon,
      "title": 'المفضلة',
      "widget": const Favourites(),
    },
    {
      "imagePath": AssetsData.locationIcon,
      "title": 'العناوين',
      "widget": const AddressesListView(),
    },
    {
      "imagePath": AssetsData.bellIcon,
      "title": 'الاشعارات',
      "widget": const NotificationView(
        emptyNotification: false,
      ),
    },
    {
      "imagePath": AssetsData.languageIcon,
      "title": 'اللغة',
      "widget": LanguageView(appState: AppState()),
    },
    {
      "imagePath": AssetsData.infoIcon,
      "title": 'من نحن',
      "widget": const AboutUsView(),
    },
    {
      "imagePath": AssetsData.headphonesIcon,
      "title": 'تواصل معنا',
      "widget": const ContactUs(),
    },
    {
      "imagePath": AssetsData.lockIcon,
      "title": 'سياسة الخصوصية',
      "widget": const PrivacyPolicyView(),
    },
    {
      "imagePath": AssetsData.truckIcon,
      "title": 'سياسه الشحن والتوصيل',
      "widget": const DeliveryAndShippingTermsView(),
    },
    {
      "imagePath": AssetsData.fileIcon,
      "title": 'الشروط والاحكام',
      "widget": const TermsAndConditions(),
    },
    {
      "imagePath": AssetsData.refreshIcon,
      "title": 'سياسة الاسترجاع والاستبدال',
      "widget": const ReturnAndExchange(),
    },
    {
      "imagePath": AssetsData.questionIcon,
      "title": 'الاسئلة الشائعة',
      "widget": const CommonQuestions(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 40.h),
          Center(
            child: LogoImageWidget(height: 80.h, width: 80.w),
          ),
          SizedBox(height: 24.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => DrawerSectionItem(
                  sectionTitle: drawerItems[index]['title'],
                  sectionIcon: drawerItems[index]['imagePath'],
                  widget: drawerItems[index]['widget'],
                  navigationButton: true),
              separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
              itemCount: drawerItems.length),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.logOutIcon,
              sectionTitle: 'تسجيل الخروج'),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}



/*

   const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.settingsImage,
              sectionTitle: 'إعدادات الحساب'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.shoppingBagIcon,
              sectionTitle: 'طلباتى'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.heartIcon,
              sectionTitle: 'المفضلة'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.locationIcon,
              sectionTitle: 'العناوين'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.bellIcon,
              sectionTitle: 'الاشعارات'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.languageIcon,
              sectionTitle: 'اللغة'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.infoIcon,
              sectionTitle: 'من نحن'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.headphonesIcon,
              sectionTitle: 'تواصل معنا'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.lockIcon,
              sectionTitle: 'سياسة الخصوصية'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.fileIcon,
              sectionTitle: 'الشروط والاحكام'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.refreshIcon,
              sectionTitle: 'سياسة الاسترجاع والاستبدال'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.refreshIcon,
              sectionTitle: 'سياسه الشحن والتوصيل'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              navigationButton: true,
              widget: CartView(),
              sectionIcon: AssetsData.infoIcon,
              sectionTitle: 'الاسئلة الشائعة'),
*/