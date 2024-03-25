import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/features/contact_us/widgets/contact_us_button.dart';
import 'package:kian_sheeps_projects/features/contact_us/widgets/contact_us_forms.dart';
import 'package:kian_sheeps_projects/features/contact_us/widgets/contacts_shortcuts.dart';
import 'package:kian_sheeps_projects/generated/l10n.dart';
import 'package:kian_sheeps_projects/helper/app_bar_method.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: S.of(context).contact_us),
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
