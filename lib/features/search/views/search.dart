import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/search_body_title.dart';
import '../../../helper/app_bar_method.dart';
import '../../../helper/color_styles.dart';
import '../../../widgets/custom_tex_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'البحث'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            const SearchBodyTitle(),
            SliverToBoxAdapter(
              child: CustomTextFormField(
                ispassword: false,
                isEnabled: true,
                hint: 'ابحث عن منتج',
                suffixIcon: Icon(
                  Icons.search_outlined,
                  color: ColorStyles.textGreyColor.withOpacity(0.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
