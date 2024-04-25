import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/contact_us/bloc/contact_us_bloc.dart';
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
      body: BlocBuilder<ContactUsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: Text('error_getting_data'.tr()));
          } else if (state is Done) {
            var bloc = ContactUsBloc.of(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                child: Column(
                  children: [
                    const ContactUsForms(),
                    const ContuctUsButton(),
                    ContactsShortcuts(
                      linkData: bloc.contactUsLinksData,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
