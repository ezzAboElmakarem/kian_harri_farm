import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/contact_us_button.dart';
import '../widgets/contact_us_forms.dart';
import '../widgets/contacts_shortcuts.dart';
import '../../../helper/app_bar_method.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "contact_us".tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: const Column(
            children: [
              ContactUsForms(),
              ContuctUsButton(),
              ContactsShortcuts(),
            ],
          ),
        ),
      ),
    );
  }
}
