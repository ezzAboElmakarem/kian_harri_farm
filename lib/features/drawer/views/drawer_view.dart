import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/AppStorage.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/features/my_orders/bloc/order_bloc.dart';
import 'package:kian_sheeps_projects/features/order_details/bloc/order_details_bloc.dart';
import 'package:kian_sheeps_projects/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import '../../about_us/views/about_us_view.dart';
import '../../update_profile/views/update_profile_view.dart';
import '../../addresses/views/addresses_list_view.dart';
import '../../common_Questions/views/common_questions.dart';
import '../../contact_us/views/contact_us.dart';
import '../widgets/drawer_section_item.dart';
import '../../favourities/views/favourities_view.dart';
import '../../language/views/language_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../../my_orders/views/orders_tapbar.dart';
import '../../privacy_Pollicy/views/privacy_policy_view.dart';
import '../../delivery_and_shiping_terms/views/delivery_shipping_terms.dart';
import '../../return_and_exchange/views/return_and_exchange_view.dart';
import '../../terms_and_conditions/views/terms_and_conditions.dart';
import '../../../helper/assets.dart';
import '../../../helper/change_locale_method.dart';
import '../../../widgets/logo_image_widget.dart';

// ignore: must_be_immutable
class DrawerView extends StatelessWidget {
  DrawerView({super.key});

  List<Map<String, dynamic>> drawerItems = [
    {
      "imagePath": AssetsData.settingsImage,
      "title": 'account_settings'.tr(),
      "onTap": () {
        UpdateProfileBloc.get(RouteUtils.context).add(Get());
        RouteUtils.pop();
        RouteUtils.navigateTo(
          const UpdateProfileView(),
        );
      }
    },
    {
      "imagePath": AssetsData.shoppingBagIcon,
      "title": 'my_orders'.tr(),
      "onTap": () {
        RouteUtils.pop();
        MyOrdersBloc.get(RouteUtils.context).add(Get());

        RouteUtils.navigateTo(
          const OrdersTabBar(),
        );
      }
    },
    {
      "imagePath": AssetsData.emptyHeartIcon,
      "title": 'favourite'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const Favourites(),
        );
      }
    },
    {
      "imagePath": AssetsData.locationIcon,
      "title": 'addresses'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          AddressesListView(
            orderDetails:
                MyOrdersDetailsBloc.of(RouteUtils.context).myOrdersDetailsData,
          ),
        );
      }
    },
    {
      "imagePath": AssetsData.bellIcon,
      "title": 'notification'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const NotificationView(),
        );
      }
    },
    {
      "imagePath": AssetsData.languageIcon,
      "title": 'language'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          LanguageView(appState: AppLocaleLang()),
        );
      }
    },
    {
      "imagePath": AssetsData.infoIcon,
      "title": 'about_us'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const AboutUsView(),
        );
      }
    },
    {
      "imagePath": AssetsData.headphonesIcon,
      "title": 'contact_us'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const ContactUs(),
        );
      }
    },
    {
      "imagePath": AssetsData.lockIcon,
      "title": 'privacy_policy'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const PrivacyPolicyView(),
        );
      }
    },
    {
      "imagePath": AssetsData.truckIcon,
      "title": 'shipping_terms'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const DeliveryAndShippingTermsView(),
        );
      }
    },
    {
      "imagePath": AssetsData.fileIcon,
      "title": 'terms_and_conditions'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const TermsAndConditions(),
        );
      }
    },
    {
      "imagePath": AssetsData.refreshIcon,
      "title": 'return_and_exchange'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const ReturnAndExchange(),
        );
      }
    },
    {
      "imagePath": AssetsData.questionIcon,
      "title": 'common_questions_title'.tr(),
      "onTap": () {
        RouteUtils.pop();

        RouteUtils.navigateTo(
          const CommonQuestions(),
        );
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  onTap: drawerItems[index]['onTap'],
                  navigationButton: true),
              separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
              itemCount: drawerItems.length),
          SizedBox(height: 24.h),
          const LogOutButton(),
          // const DrawerSectionItem(
          //     navigationButton: true,
          //     widget: CartView(),
          //     sectionIcon: AssetsData.logOutIcon,
          //     sectionTitle: 'تسجيل الخروج'),

          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        AppStorage.signOut();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Image.asset(
              AssetsData.logOutIcon,
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "log_out".tr(),
              style: TextStyles.textstyle14,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
