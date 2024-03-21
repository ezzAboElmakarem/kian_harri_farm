import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/features/drawer/widgets/drawer_section_item.dart';
import 'package:kian_sheeps_projects/helper/assets.dart';
import 'package:kian_sheeps_projects/helper/text_styles.dart';
import 'package:kian_sheeps_projects/widgets/logo_image_widget.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

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
          // ListView.separated(
          //     shrinkWrap: true,
          //     physics: const BouncingScrollPhysics(),
          //     itemBuilder: (context, index) => const DrawerSectionItem(),
          //     separatorBuilder: (context, index) => SizedBox(
          //           height: 24.h,
          //         ),
          //     itemCount: 13),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.settingsImage,
              sectionTitle: 'إعدادات الحساب'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.shoppingBagIcon,
              sectionTitle: 'طلباتى'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.heartIcon,
              sectionTitle: 'المفضلة'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.locationIcon,
              sectionTitle: 'العناوين'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.bellIcon,
              sectionTitle: 'الاشعارات'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.languageIcon,
              sectionTitle: 'اللغة'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.infoIcon,
              sectionTitle: 'من نحن'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.headphonesIcon,
              sectionTitle: 'تواصل معنا'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.lockIcon,
              sectionTitle: 'سياسة الخصوصية'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.fileIcon,
              sectionTitle: 'الشروط والاحكام'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.refreshIcon,
              sectionTitle: 'سياسة الاسترجاع والاستبدال'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.refreshIcon,
              sectionTitle: 'سياسه الشحن والتوصيل'),
          SizedBox(height: 24.h),
          const DrawerSectionItem(
              widget: CartView(),
              sectionIcon: AssetsData.infoIcon,
              sectionTitle: 'الاسئلة الشائعة'),
          SizedBox(height: 24.h),

          InkWell(
            onTap: () {
              log('message');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  const Spacer(),
                  Text('تسجيل الخروج', style: TextStyles.textstyle14),
                  SizedBox(width: 8.w),
                  Image.asset(AssetsData.logOutIcon, height: 24.h, width: 24.w),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
